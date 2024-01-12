import 'package:flutter/material.dart';

class DialogUtils {
  static void showCheckoutDialog(BuildContext context, List<Map<String, dynamic>> items, List<int> itemQuantities) {
    final amountBought = itemQuantities.reduce((sum, quantity) => sum + quantity);

    // Generate a message for each item
    final itemMessages = List<String>.generate(items.length, (index) {
      return '${itemQuantities[index]} ${items[index]['productName']}';
    });

    final message = 'You have added $amountBought items to your bag:\n${itemMessages.join(", ")}';

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Congratulations'),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  static void showAdd5UnitsDialog(BuildContext context, String itemName) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Added 5 Units'),
          content: Text('You have added 5 $itemName items to your bag!'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
