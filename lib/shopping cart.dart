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
        Padding(
          padding: const EdgeInsets.all(8),
          child: Align(
            alignment: Alignment.bottomLeft,
            child: Text(
              'My Bag',
              style: TextStyle(
                fontSize: 34,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: CartItem(
                  index: index,
                  itemCount: itemQuantities[index],
                  unitPrice: items[index]['price'],
                  onItemAdded: _addItem,
                  onItemRemoved: _removeItem,
                  productName: items[index]['productName'],
                  productColor: items[index]['productColor'],
                  productSize: items[index]['productSize'],
                  imageURL: items[index]['imageURL'],
                ),
              );
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Total Price:'),
                  Text('\$${calculateTotalPrice().toStringAsFixed(2)}',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                ],
              ),
              SizedBox(height: 20,),
              FractionallySizedBox(
                widthFactor: .9,
                child: ElevatedButton(
                  onPressed: () {
                    showCheckoutDialog();
                  },
                  style: ElevatedButton.styleFrom(
                    shape: StadiumBorder(),
                    primary: Color(0xFFDB3022),
                    padding: const EdgeInsets.symmetric(vertical: 14.0),
                  ),
                  child: const Text('CHECK OUT'),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}