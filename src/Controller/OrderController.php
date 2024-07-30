<?php

namespace App\Controller;

use App\Entity\Order;
use App\Form\OrderType;
use App\Repository\OrderRepository;
use App\Repository\ProductRepository;
use App\Service\StripePayement;
use App\Service\StripePayment;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\HttpFoundation\Session\SessionInterface;
use Symfony\Component\Routing\Attribute\Route;

class OrderController extends AbstractController
{
    #[Route('/order', name: 'app_order')]
    public function index(Request $request, SessionInterface $session, ProductRepository $productRepository): Response
    {
        $cart = $session->get('cart', []);
        $cartWithData = [];

        foreach ($cart as $item) {
            if (isset($item['id'], $item['size'], $item['quantity'])) {
                $product = $productRepository->find($item['id']);
                if ($product) {
                    $cartWithData[] = [
                        'product' => $product,
                        'size' => $item['size'],
                        'quantity' => $item['quantity'],
                    ];
                }
            }
        }

        $total = array_sum(array_map(function($item) {
            return $item['product']->getPrice() * $item['quantity'];
        }, $cartWithData));

        $cartWithData['total'] = $total;

        $order = new Order();
        $form = $this->createForm(OrderType::class, $order);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $payement = new StripePayement();

            $payement->startPayment($cartWithData);

            $stripeRedirectUrl = $payement->getStripeRedirectUrl();

            return $this->redirect($stripeRedirectUrl);
            
        }
        

        return $this->render('order/index.html.twig', [
            'form'=>$form->createView(),
            'total'=>$total,
            'page_title' => 'Order'
        ]);
    }

    #[Route("/order-ok-message",name:'order_ok_mesage')]
    public function orderMessage():Response{
        return $this->render('order/order_message.twig');
    }

    #[Route('/editor/order', name: 'app_order_show')]
    public function getAllOrder(OrderRepository $orderRepository):Response
    {
        $order = $orderRepository->findAll();

        return $this->render('order/order.html.twig',[
            "orders"=>$order,
            'page_title' => 'Order',
        ]);
    }

}