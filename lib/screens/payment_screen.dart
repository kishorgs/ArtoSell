import 'package:ecommerce/screens/upi_payment.dart';
import 'package:flutter/material.dart';

import 'credit_card.dart';

class PaymentOptionsScreen extends StatelessWidget {

  const PaymentOptionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Payment Options'),
      ),
      
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Select your payment option ",
            style: TextStyle(fontFamily: 'RobotoMono',fontSize: 24.0),
            ),
            PaymentOptionCard(
              icon: Icons.credit_card,
              title: 'Credit Card',
              onPressed: () {
                Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const CreditCardPaymentScreen()),
                    );
              },
            ),
            PaymentOptionCard(
              icon: Icons.payment,
              title: 'Upi payment',
              onPressed: () {
                Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const UpiPaymentScreen()),
                    );
                  },
            ),
            // Add more payment options as needed
          ],
        ),
      ),
    );
  }
}

class PaymentOptionCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onPressed;

  const PaymentOptionCard({super.key, 
    required this.icon,
    required this.title,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: InkWell(
        onTap: onPressed,
        child: Card(
          elevation: 4,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Icon(icon, size: 40),
                const SizedBox(width: 16),
                Text(
                  title,
                  style: const TextStyle(fontSize: 18),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: PaymentOptionsScreen(),
  ));
}
