import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart.dart';
import '../models/product.dart';

class ProductItem extends StatelessWidget {
  final Product product;
  final CartProvider cartProvider; // Pass the CartProvider

  const ProductItem({
    required this.product,
    required this.cartProvider, // Accept the CartProvider reference
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridTile(
      footer: GridTileBar(
        backgroundColor: Colors.black87,
        title: Text(
          product.title,
          textAlign: TextAlign.center,
        ),
        trailing: IconButton(
          icon: const Icon(Icons.shopping_cart),
          onPressed: () {
            Provider.of<CartProvider>(context, listen: false).addItem(product);
          },

        ),
      ),
      child: Image.asset(
        product.assetPath,
        fit: BoxFit.cover,
      ),
    );
  }
}
