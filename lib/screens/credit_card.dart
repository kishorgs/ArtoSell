import 'package:flutter/material.dart';
import '../splash_screen/splash_screen.dart';

void main() {
  runApp(const CreditCardPaymentApp());
}

class CreditCardPaymentApp extends StatelessWidget {
  const CreditCardPaymentApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Credit Card Payment',
      home: CreditCardPaymentScreen(),
    );
  }
}

class CreditCardPaymentScreen extends StatefulWidget {
  const CreditCardPaymentScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CreditCardPaymentScreenState createState() => _CreditCardPaymentScreenState();
}

class _CreditCardPaymentScreenState extends State<CreditCardPaymentScreen> {
  String cardNumber = '';
  String cardHolderName = '';
  String expirationDate = '';
  String cvv = '';

  bool isPaymentCompleted = false;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Credit Card Payment'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Navigate back to the previous screen
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
                decoration: const InputDecoration(labelText: 'Card Number (12 digits)'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter the card number';
                  } else if (value.length != 12) {
                    return 'Card number should be exactly 12 digits';
                  }
                  return null;
                },
                onChanged: (value) {
                  setState(() {
                    cardNumber = value;
                  });
                },
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Card Holder Name'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter the card holder name';
                  }
                  return null;
                },
                onChanged: (value) {
                  setState(() {
                    cardHolderName = value;
                  });
                },
              ),
              const SizedBox(height: 16.0),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      decoration: const InputDecoration(labelText: 'Expiration Date (MM/YY)'),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter the expiration date';
                        } else if (!_isValidExpirationDate(value)) {
                          return 'Invalid expiration date format';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        setState(() {
                          expirationDate = value;
                        });
                      },
                    ),
                  ),
                  const SizedBox(width: 16.0),
                  Expanded(
                    child: TextFormField(
                      decoration: const InputDecoration(labelText: 'CVV (3 digits)'),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter the CVV';
                        } else if (value.length != 3) {
                          return 'CVV should be exactly 3 digits';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        setState(() {
                          cvv = value;
                        });
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32.0),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Process the payment with the entered information
                    // Here you would typically send the data to a payment gateway
                    // and handle the payment process.

                    // Simulate completing payment
                    setState(() {
                      isPaymentCompleted = true;
                    });

                    // Show payment completed dialog
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text('Payment Completed'),
                          content: const Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.sentiment_very_satisfied,
                                size: 48,
                                color: Colors.green,
                              ),
                              SizedBox(height: 16),
                              Center(
                                child: Text(
                                  'Your payment was successfully completed.\nYour product will reach you soon.\nThank you!!!',
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop(); 
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => const SplashScreen()),
                                );
                              },
                              child: const Text('OK'),
                            ),
                          ],
                        );
                      },
                    );
                  }
                },
                child: const Text('Make Payment'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  bool _isValidExpirationDate(String value) {
    if (value.length != 5) {
      return false;
    }
    final parts = value.split('/');
    if (parts.length != 2) {
      return false;
    }
    final month = int.tryParse(parts[0]);
    final year = int.tryParse(parts[1]);
    return month != null && year != null && month >= 1 && month <= 12;
  }
}
