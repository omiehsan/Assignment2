import 'package:assignment_2/shopping%20cart.dart';
import 'package:flutter/material.dart';

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
            color: Colors.black,
            onPressed: () {
            },
          ),
        ],
      ),
      body: FractionallySizedBox(
        widthFactor: 1.0,
        alignment: Alignment.center,
        child: ShoppingCart(),
      ),
    );
  }
}
