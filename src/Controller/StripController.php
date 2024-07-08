<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;

class StripController extends AbstractController
{
    #[Route('/strip', name: 'app_strip')]
    public function index(): Response
    {
        $stripePublicKey = $this->getParameter('stripe_public_key');

        return $this->render('strip/index.html.twig', [
            'stripe_public_key' => $stripePublicKey,
            'page_title' => 'Paiement'
        ]);
    }
}
