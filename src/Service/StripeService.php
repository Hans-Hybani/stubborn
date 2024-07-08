<?php
                                      
namespace App\Service;

use Stripe\StripeClient;

class StripeService
{
    private $stripe;
    private $stripePublicKey;

    public function __construct(string $stripeSecretKey, string $stripePublicKey)
    {
        $this->stripe = new StripeClient($stripeSecretKey);
        $this->stripePublicKey = $stripePublicKey;
    }

    public function createPaymentIntent(int $amount, string $currency = 'usd')
    {
        return $this->stripe->paymentIntents->create([
            'amount' => $amount,
            'currency' => $currency,
        ]);
    }

    public function getStripePublicKey(): string
    {
        return $this->stripePublicKey;
    }
}
