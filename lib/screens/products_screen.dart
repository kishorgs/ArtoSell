import 'package:ecommerce/providers/cart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/product.dart';
import '../widgets/product_item.dart';
import 'cart_screen.dart';

class ProductsScreen extends StatefulWidget implements PreferredSizeWidget{
  final List<Product> products;

  const ProductsScreen(this.products, {super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
  
  @override
  Size get preferredSize => const Size.fromHeight(60);
}

class _ProductsScreenState extends State<ProductsScreen> {
  

  @override
  Widget build(BuildContext context) {

    final cartProvider = Provider.of<CartProvider>(context);
    final cartItems = cartProvider.items;

    return Scaffold(
      appBar: AppBar(
        title: const Text('ArtoSell'),
        actions: [
        GestureDetector(
          onTap: () {
            if (cartItems.isNotEmpty) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const CartScreen()),
              );
            }
          },
          child: Container(
            margin: const EdgeInsets.only(right: 16),
            child: Row(
              children: [
                const Icon(Icons.shopping_cart),
                const SizedBox(width: 8),
                Text(cartItems.length.toString()),
              ],
            ),
          ),
        ),
      ],
      ),
      body: GridView.builder(
        itemCount: widget.products.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemBuilder: (ctx, index) {
          return ProductItem(
            product: widget.products[index],
            cartProvider: cartProvider, // Pass the CartProvider reference
          );
        },
      ),
    );
  }
}
