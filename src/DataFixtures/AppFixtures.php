<?php

namespace App\DataFixtures;

use App\Entity\Product;
use App\Entity\User;
use Doctrine\Bundle\FixturesBundle\Fixture;
use Doctrine\Persistence\ObjectManager;
use Symfony\Component\PasswordHasher\Hasher\UserPasswordHasherInterface;

class AppFixtures extends Fixture
{
    private UserPasswordHasherInterface $passwordHasher;

    public function __construct(UserPasswordHasherInterface $passwordHasher)
    {
        $this->passwordHasher = $passwordHasher;
    }

    public function load(ObjectManager $manager): void
    {
        // Create User
        $user = new User();
        $user->setEmail('hh@gmail.com');
        $user->setLastName('Hans');
        $user->setDeliveryAdress('123 Main St, Anytown, USA');
        $user->setRoles(['ROLE_ADMIN', 'ROLE_EDITOR', 'ROLE_USER']);
        $hashedPassword = $this->passwordHasher->hashPassword($user, 'azerty');
        $user->setPassword($hashedPassword);

        $manager->persist($user);

        // Define indices for highlighted products
        // Define indices for highlighted products
        $highlightedIndices = [0, 4, 6]; // Indices des produits à mettre en avant

        // Create Products
        $products = [
            ['name' => 'Blackbelt', 'price' => 29.90, 'image' => '1.jpeg'],
            ['name' => 'BlueBelt', 'price' => 29.90, 'image' => '2.jpeg'],
            ['name' => 'Street', 'price' => 34.50, 'image' => '3.jpeg'],
            ['name' => 'Pokeball', 'price' => 45.00, 'image' => '4.jpeg'],
            ['name' => 'PinkLady', 'price' => 29.90, 'image' => '5.jpeg'],
            ['name' => 'Snow', 'price' => 32.00, 'image' => '6.jpeg'],
            ['name' => 'Greyback', 'price' => 28.50, 'image' => '7.jpeg'],
            ['name' => 'BlueCloud', 'price' => 45.00, 'image' => '8.jpeg'],
            ['name' => 'BornInUsa', 'price' => 59.90, 'image' => '9.jpeg'],
            ['name' => 'GreenSchool', 'price' => 42.20, 'image' => '10.jpeg'],
        ];

        $sizes = ['S', 'M', 'L', 'XL']; // Tailles disponibles
        $stockValues = [10, 20, 15, 5, 8, 12, 7, 9, 4, 6]; // Valeurs de stock pour chaque produit

        foreach ($products as $index => $productData) {
            foreach ($sizes as $size) {
                $product = new Product();
                $product->setName($productData['name']);
                $product->setDescription('Description for ' . $productData['name']);
                $product->setPrice($productData['price']);
                $product->setSize($size);
                $product->setUserSize($size); // On assigne la même taille pour userSize ici
                $product->setStock($stockValues[$index]); // Assigner un stock basé sur l'index du produit
                $product->setImage($productData['image']);
                // Met en avant les produits sélectionnés par indice
                $product->setHighlighted(in_array($index, $highlightedIndices));

                $manager->persist($product);
            }
        }

        $manager->flush();
    }
}
