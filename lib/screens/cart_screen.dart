import 'package:ecommerce/screens/user_info.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart.dart';

double totalAmount = 0;

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    final cartItems = cartProvider.items;

    // Calculate the total amount
    totalAmount = 0;
    for (var cartItem in cartItems) {
      totalAmount += cartItem.quantity * cartItem.product.price;
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              itemCount: cartItems.length,
              itemBuilder: (ctx, index) {
                final cartItem = cartItems[index];
                final product = cartItem.product;

                return ListTile(
                  leading: Text(
                    product.title,
                    style: const TextStyle(fontSize: 20.0),
                    textAlign: TextAlign.center,
                  ),
                  title: Text(
                    'Quantity: ${cartItem.quantity.toString()}',
                  ),
                  subtitle: Text(
                    'Amount: \u{20B9}${(cartItem.quantity * product.price).toStringAsFixed(2)}',
                  ),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {
                      cartProvider.removeItem(product.id);
                    },
                  ),
                );
              },
            ),
          ),
          // Display the total amount at the bottom
          Container(
            padding: const EdgeInsets.all(24.0),
            alignment: Alignment.center,
            child: Column(
              children: [
                Text(
                  'Total Amount: \u{20B9}${totalAmount.toStringAsFixed(2)}',
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16), // Add some spacing
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const UserInfoFormScreen()),
                    );
                  },
                  child: const Text('Proceed to Payment'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
