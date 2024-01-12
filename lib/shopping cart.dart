import 'package:flutter/material.dart';
import 'cart_item.dart';
import 'show_dialogues.dart';

class ShoppingCart extends StatefulWidget {
  @override
  _ShoppingCartState createState() => _ShoppingCartState();
}

class _ShoppingCartState extends State<ShoppingCart> {
  List<int> itemQuantities = List.filled(5, 0);

  List<Map<String, dynamic>> items = [
    {
      'productName': 'T-Shirt',
      'productColor': 'White',
      'productSize': 'L',
      'imageURL': 'https://www.king-apparel.com/media/wysiwyg/180723-king-apparel-tshirts-002.jpg',
      'price': 100.0,
    },
    {
      'productName': 'Jeans',
      'productColor': 'Blue',
      'productSize': 'M',
      'imageURL': 'https://ksubi.com/cdn/shop/collections/Denim_Category_Slider_WomensPointer_01c0faa3-ad98-4174-b069-99cae41bc29f.jpg?v=1688537262',
      'price': 80.0,
    },
    {
      'productName': 'Pullover',
      'productColor': 'Sky',
      'productSize': 'S',
      'imageURL': 'https://static.nike.com/a/images/t_PDP_1280_v1/f_auto,q_auto:eco,u_126ab356-44d8-4a06-89b4-fcdcc8df0245,c_scale,fl_relative,w_1.0,h_1.0,fl_layer_apply/454a5346-64ef-4467-8680-bd3ac29650c7/jordan-23-engineered-fleece-pullover-HJ7cbT.png',
      'price': 130.0,
    },
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
        Text(
          'My Bag',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: items.length * 2 - 1,
            itemBuilder: (context, index) {
              if (index.isOdd) {
                return SizedBox(height: 20);
              }
              final cardIndex = index ~/ 2;
              return CartItem(
                index: cardIndex,
                itemCount: itemQuantities[cardIndex],
                unitPrice: items[cardIndex]['price'],
                onItemAdded: _addItem,
                onItemRemoved: _removeItem,
                productName: items[cardIndex]['productName'],
                productColor: items[cardIndex]['productColor'],
                productSize: items[cardIndex]['productSize'],
                imageURL: items[cardIndex]['imageURL'],
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