import 'package:assignment_2/show_dialogues.dart';
import 'package:flutter/material.dart';
import 'cart_item.dart';

class ShoppingCart extends StatefulWidget {
  @override
  _ShoppingCartState createState() => _ShoppingCartState();
}

class _ShoppingCartState extends State<ShoppingCart> {
  List<int> itemQuantities = List.filled(5, 0);
  double unitPrice = 0; // Set your default unit price here

  List<Map<String, dynamic>> items = [
    // Your item data...
  ];

  void _addItem(int index) {
    setState(() {
      itemQuantities[index]++;
      if (itemQuantities[index] == 5) {
        DialogUtils.showAdd5UnitsDialog(context, items[index]['productName']);
      }
    });
  }

  void _removeItem(int index) {
    setState(() {
      itemQuantities[index] =
      (itemQuantities[index] > 0) ? itemQuantities[index] - 1 : 0;
    });
  }

  double calculateTotalPrice() {
    double totalPrice = 0;
    for (int i = 0; i < items.length; i++) {
      totalPrice += itemQuantities[i] * items[i]['price'];
    }
    return totalPrice;
  }

  void showCheckoutDialog() {
    DialogUtils.showCheckoutDialog(context, items, itemQuantities);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              return CartItem(
                index: index,
                itemCount: itemQuantities[index],
                unitPrice: items[index]['price'],
                onItemAdded: _addItem,
                onItemRemoved: _removeItem,
                productName: items[index]['productName'],
                productColor: items[index]['productColor'],
                productSize: items[index]['productSize'],
                imageURL: items[index]['imageURL'],
              );
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Text('Total Price: \$${calculateTotalPrice().toStringAsFixed(2)}'),
              ElevatedButton(
                onPressed: () {
                  showCheckoutDialog();
                },
                child: Text('Checkout'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
