import 'package:flutter/material.dart';

class DialogUtils {
  static void showCheckoutDialog(BuildContext context, List<Map<String, dynamic>> items, List<int> itemQuantities) {
    final amountBought = itemQuantities.reduce((sum, quantity) => sum + quantity);

    final message = 'You have added $amountBought items to your bag.';

    var showSnackBar = ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.transparent,
        padding: const EdgeInsets.all(8.0),
        content: Text(
          'Congratulations! $message',
          style: const TextStyle(color: Colors.black),
          textAlign: TextAlign.center,
        ),
        duration: const Duration(seconds: 3),
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.only(bottom: 100.0),
      ),
    );
  }

  static void showAdd5UnitsDialog(BuildContext context, String itemName) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Congratulation!', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18), textAlign: TextAlign.center),
          content: Text(
            'You have added\n 5 $itemName \nto your bag!', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            textAlign: TextAlign.center,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.0),
          ),
          actions: [
            Center(
              child: FractionallySizedBox(
                widthFactor: 0.8,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    style: ElevatedButton.styleFrom(
                      shape: const StadiumBorder(),
                      primary: const Color(0xFFDB3022),
                      padding: const EdgeInsets.symmetric(vertical: 14.0),
                    ),
                    child: const Text(
                      'OKAY',
                      style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
