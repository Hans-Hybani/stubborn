<?php

// namespace App\Service;

// use Stripe\BillingPortal\Session;
// use Stripe\Stripe;

// class StripePayement
// {

//         private $redirectUrl;

//         public function __construct()
//         {
//             Stripe::setApiKey($_SERVER['STRIPE_SECRET']);  
//             Stripe::setApiVersion('2024-06-20');
//         }

//         public function startPayement($cartWithData){
//             $cartProducts = $cartWithData['cart'];
//             $products = [];

//             foreach ($cartProducts as $value) {
//                   $productItem = [];
//                   $productItem['name'] = $value['product']->getName();
//                   $productItem['price'] = $value['product']->getPrice();
//                   $productItem['qte'] = $value['quantity'];
//                   $products[] = $productItem;
//             }
            
//             $session = Session::create([
//                   'line_items'=>[
//                         array_map(fn(array $product)=>[
//                               'quantity'=> $product['qte'],
//                               'price_data' => [
//                                     'currency' => 'EUR',
//                                     'product_data' => [
//                                           'name'=> $product['name']
//                                     ],
//                                     'unit_amount' => $product['prise']*100
//                               ],
//                         ],$products)
//                   ],
//                   'mode' => 'payement',
//                   'cancel_url' => 'http://127.0.0.1:8000/pay/cancel',
//                   'success_url' => 'http://127.0.0.1:8000/pay/success',
//                   'billing_address_collection' => 'required',
//                   'shipping_addressçcollection' => [
//                         'allowed_countries' => ['FR',"DRC"]
//                   ],
//                   'metadata'=>[

//                   ]
//             ]);

//             $this->redirectUrl = $session->url;
//         }
//          public function getStripeRedirectUrl(){
//             return $this->redirectUrl;
//          }
// }
namespace App\Service;

use Stripe\Checkout\Session as StripeSession;
use Stripe\Stripe;

class StripePayement
{
    private $redirectUrl;

    public function __construct()
    {
        // Utilise les variables d'environnement pour la clé API Stripe
        Stripe::setApiKey($_ENV['STRIPE_SECRET']);  
        Stripe::setApiVersion('2024-06-20');
    }

    public function startPayment(array $cartWithData)
    {
        $cartProducts = $cartWithData; // Pas besoin de ['cart'] ici si $cartWithData est déjà le tableau de produits
        $products = [];

        foreach ($cartProducts as $value) {
            if (isset($value['product']) && isset($value['quantity'])) {
                $productItem = [
                    'name' => $value['product']->getName(),
                    'price' => $value['product']->getPrice(),
                    'qte' => $value['quantity'],
                ];
                $products[] = $productItem;
            }
        }

        // Crée la session de paiement avec Stripe
        $session = StripeSession::create([
            'line_items' => array_map(function(array $product) {
                return [
                    'quantity' => $product['qte'],
                    'price_data' => [
                        'currency' => 'eur',
                        'product_data' => [
                            'name' => $product['name'],
                        ],
                        'unit_amount' => $product['price'] * 100, // Le prix doit être en centimes
                    ],
                ];
            }, $products),
            'mode' => 'payment', // Le mode doit être 'payment'
            'cancel_url' => 'http://127.0.0.1:8000/pay/cancel',
            'success_url' => 'http://127.0.0.1:8000/pay/success',
            'billing_address_collection' => 'required',
            'shipping_address_collection' => [ // Correction de la faute de frappe
                'allowed_countries' => ['FR', 'US'],
            ],
            'metadata' => [],
        ]);

        $this->redirectUrl = $session->url;
    }

    public function getStripeRedirectUrl(): string
    {
        return $this->redirectUrl;
    }
}