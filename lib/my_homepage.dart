import 'package:flutter/material.dart';
import 'shopping cart.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: double.infinity,
        title: const Text(''),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // Handle the search button press
            },
          ),
          IconButton(
            icon: const Icon(Icons.search),
            color: Colors.black,
            onPressed: () {
              // Handle the checkout button press
            },
          ),
        ],
      ),
      body:ShoppingCart(),
    );
  }
}
