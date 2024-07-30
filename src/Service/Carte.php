<?php

namespace App\Service;

use App\Repository\ProductRepository;

class Cart
{
        public function __construct(private readonly ProductRepository $productRepository)
        {
            
        }
        public function getcart($session):array
        {
                $cart = $session->get('cart', []);
                $cartWithData = [];
        
                foreach ($cart as $item) {
                    if (isset($item['id'], $item['size'], $item['quantity'])) {
                        $product = $this->productRepository->find($item['id']);
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
                
                return [
                        'cart'=>$cartWithData,
                        'total'=>$total
                ];
        }
}