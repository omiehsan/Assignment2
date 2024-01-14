import 'package:flutter/material.dart';

class DialogUtils {
  static void showCheckoutDialog(BuildContext context, List<Map<String, dynamic>> items, List<int> itemQuantities) {
    final amountBought = itemQuantities.reduce((sum, quantity) => sum + quantity);

    final message = 'You have added\n $amountBought\n items to your bag.';

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Align(alignment: Alignment.center,child: Text('Congratulations!')),
          content: Text(
            message,
            textAlign: TextAlign.center, // Center-align the text
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.0), // Adjust the radius as needed
          ),
          actions: [
            Center(
              child: FractionallySizedBox(
                widthFactor: 0.8, // Adjust the width factor as needed
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    style: ElevatedButton.styleFrom(
                      shape: StadiumBorder(),
                      primary: const Color(0xFFDB3022), // Red color
                      padding: const EdgeInsets.symmetric(vertical: 14.0), // Adjust padding for button height
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

  static void showAdd5UnitsDialog(BuildContext context, String itemName) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Added 5 Units'),
          content: Text(
            'You have added 5 $itemName to your bag!',
            textAlign: TextAlign.center, // Center-align the text
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.0), // Adjust the radius as needed
          ),
          actions: [
            Center(
              child: FractionallySizedBox(
                widthFactor: 0.8, // Adjust the width factor as needed
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    style: ElevatedButton.styleFrom(
                      shape: StadiumBorder(),
                      primary: const Color(0xFFDB3022), // Red color
                      padding: const EdgeInsets.symmetric(vertical: 14.0), // Adjust padding for button height
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
