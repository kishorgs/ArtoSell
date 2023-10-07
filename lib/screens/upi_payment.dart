import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:ecommerce/screens/cart_screen.dart';

import '../splash_screen/splash_screen.dart';

void main() {
  runApp(const UpiPaymentApp());
}

class UpiPaymentApp extends StatelessWidget {
  const UpiPaymentApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'UPI Payment',
      home: UpiPaymentScreen(),
    );
  }
}

class UpiPaymentScreen extends StatefulWidget {
  const UpiPaymentScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _UpiPaymentScreenState createState() => _UpiPaymentScreenState();
}

class _UpiPaymentScreenState extends State<UpiPaymentScreen> {
  TextEditingController upiIdController = TextEditingController();
  TextEditingController amountController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    upiIdController.dispose();
    amountController.dispose();
    super.dispose();
  }

  void initiatePayment() async {
    if (!_formKey.currentState!.validate()) {
      return; // If form is not valid, stop the payment initiation
    }

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirm Payment'),
          content: const Text('Do you want to initiate the UPI payment?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
                _performPayment();
                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => const SplashScreen()),
                                ); // Initiate the payment
              },
              child: const Text('Yes'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
                _showPaymentFailedDialog(); // Show payment failed dialog
              },
              child: const Text('No'),
            ),
          ],
        );
      },
    );
  }

  void _performPayment() async {
    String upiId = upiIdController.text;
    String amount = amountController.text;

    // Construct the UPI URL
    String upiUrl =
        'upi://pay?pa=$upiId&pn=Recipient&mc=123456&tid=1234567890123456&tn=Payment%20for%20Purchase&am=$amount&cu=INR';

    // ignore: deprecated_member_use
    if (await canLaunch(upiUrl)) {
      // ignore: deprecated_member_use
      await launch(upiUrl);

      _showPaymentSuccessDialog(); // Show payment success dialog
    } else {
      // Handle if the UPI app can't be launched
      _showPaymentFailedDialog();
    }
  }

  void _showPaymentSuccessDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Payment Successful'),
          content: const Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.sentiment_very_satisfied,
                size: 48,
                color: Colors.green,
              ),
              SizedBox(height: 16),
              Text('Payment successful! Thank you for your purchase.'),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => const SplashScreen()),
                                ); // Close the dialog
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void _showPaymentFailedDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Payment Failed'),
          content: const Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.sentiment_dissatisfied,
                size: 48,
                color: Colors.red,
              ),
              SizedBox(height: 16),
              Text('Payment failed. Please try again.'),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('UPI Payment'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Go back to the previous screen
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: upiIdController,
                decoration: const InputDecoration(labelText: 'UPI ID'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter the UPI ID';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),
              Text(
                "\u{20B9}$totalAmount",
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),

              ),
              const SizedBox(height: 32.0),
              ElevatedButton(
                onPressed: initiatePayment,
                child: const Text('Make UPI Payment'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
