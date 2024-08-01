<?php

namespace App\Controller;

use App\Entity\Product;
use App\Repository\CategoryRepository;
use App\Repository\ProductRepository;
use App\Repository\SubCategoryRepository;
use Knp\Component\Pager\PaginatorInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;

class HomeController extends AbstractController
{
    #[Route('/', name: 'app_home', methods:['GET'])]
    public function index(ProductRepository $productRepository, CategoryRepository $categoryRepository, PaginatorInterface $paginator, Request $request): Response
    {
        $data = $productRepository->findBy([], ['id' => 'DESC']);
        $products = $paginator->paginate(
            $data,
            $request->query->getInt('page', 1),
            3
        );

        // Fetch highlighted products
        $highlightedProducts = $productRepository->findHighlighted();

        return $this->render('home/index.html.twig', [
            'products' => $products,
            'categories' => $categoryRepository->findAll(),
            'highlightedProducts' => $highlightedProducts,
            'page_title' => 'Accueil'
        ]);
    }

    #[Route('/home/product/{id}/show', name: 'app_home_product_show', methods:['GET'])]
    public function show(Product $product, ProductRepository $productRepository, CategoryRepository $categoryRepository): Response
    {
        $lastProducts = $productRepository->findBy([],['id'=>'DESC'],5);
        return $this->render('home/show.html.twig', [
            'product'=>$product,
            'products'=>$lastProducts,
            'categories'=>$categoryRepository->findAll(),
            'page_title' => 'Panier',
        ]);
    }


    #[Route('/home/product/filter', name: 'app_home_product_filter', methods: ['GET'])]
    public function filter(Request $request, ProductRepository $productRepository): Response
    {
        $products = $productRepository->findAll();

        $minPrice = $request->query->get('min_price');
        $maxPrice = $request->query->get('max_price');

        if ($minPrice !== null && $maxPrice !== null) {
            $filteredProducts = array_filter($products, function ($product) use ($minPrice, $maxPrice) {
                return $product->getPrice() >= $minPrice && $product->getPrice() <= $maxPrice;
            });
        } else {
            $filteredProducts = $products;
        }

        return $this->render('product/boutique.html.twig', [
            'products' => $filteredProducts,
            'page_title' => 'Filtrage par Prix',
        ]);
    }

}
