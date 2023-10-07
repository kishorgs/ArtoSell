import 'package:ecommerce/screens/products_screen.dart';
import 'package:ecommerce/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/cart.dart';
import 'models/product.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: SplashScreen(), // Start with SplashScreen
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) => CartProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'ArtoSell',
        theme: ThemeData(
          primarySwatch: Colors.deepPurple,
        ),
        home: ProductsScreen(_dummyProducts),
      ),
    );
  }
}


List<Product> _dummyProducts = [
  Product(
              id: 1,
              title: 'Product 1',
              description: 'Description for Product 1',
              price: 29.99,
              assetPath: "products/product1.jpg",
              //quantity:1,
            ),
            Product(
              id: 2,
              title: 'Product 2',
              description: 'Description for Product 2',
              price: 39.99,
              assetPath: "products/product2.jpg",
              //quantity:1,
            ),
            Product(
              id: 3,
              title: 'Product 3',
              description: 'Description for Product 3',
              price: 19.99,
              assetPath: "products/product3.jpg",
              //quantity:1,
            ),
            Product(
              id: 4,
              title: 'Product 4',
              description: 'Description for Product 4',
              price: 29.99,
              assetPath: "products/product4.jpg",
              //quantity:1,
            ),
            Product(
              id: 5,
              title: 'Product 5',
              description: 'Description for Product 5',
              price: 29.99,
              assetPath: "products/product5.jpg",
              //quantity:1,
            ),
            Product(
              id: 6,
              title: 'Product 6',
              description: 'Description for Product 6',
              price: 29.99,
              assetPath: "products/product6.jpg",
              //quantity:1,
            ),
            Product(
              id: 7,
              title: 'Product 7',
              description: 'Description for Product 7',
              price: 29.99,
              assetPath: "products/product7.jpg",
              //quantity:1,
            ),
            Product(
              id: 8,
              title: 'Product 8',
              description: 'Description for Product 8',
              price: 19.99,
              assetPath: "products/product8.jpg",
              //quantity:1,
            ),
            Product(
              id: 9,
              title: 'Product 9',
              description: 'Description for Product 9',
              price: 19.99,
              assetPath: "products/product9.jpg",
              //quantity:1,
            ),
            Product(
              id: 10,
              title: 'Product 10',
              description: 'Description for Product 10',
              price: 19.99,
              assetPath: "products/product10.jpg",
              //quantity:1,
            ),
            Product(
              id: 11,
              title: 'Product 11',
              description: 'Description for Product 11',
              price: 19.99,
              assetPath: "products/product11.jpg",
              //quantity:1,
            ),
            Product(
              id: 12,
              title: 'Product 12',
              description: 'Description for Product 12',
              price: 19.99,
              assetPath: "products/product12.jpg",
              //quantity:1,
            ),
];
