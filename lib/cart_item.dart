import 'package:flutter/material.dart';

class CartItem extends StatefulWidget {
  final int index;
  final int itemCount;
  final double unitPrice;
  final String productName;
  final String productColor;
  final String productSize;
  final String imageURL;
  final ValueChanged<int> onItemAdded;
  final ValueChanged<int> onItemRemoved;

  CartItem({
    required this.index,
    required this.itemCount,
    required this.unitPrice,
    required this.productName,
    required this.productColor,
    required this.productSize,
    required this.imageURL,
    required this.onItemAdded,
    required this.onItemRemoved,
  });

  @override
  _CartItemState createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  late TextEditingController imageURLController;

  @override
  void initState() {
    super.initState();
    imageURLController = TextEditingController(text: widget.imageURL);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0), // Set your preferred border radius
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 0,bottom: 0,right: 8,top: 0),
        child: Row(
          children: [
            _buildImage(),
            SizedBox(width: 8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.productName),
                  Text(
                    'Color: ${widget.productColor}, Size: ${widget.productSize}',
                  ),
                  Row(
                    children: [
                      _buildCounterButton(Icons.remove, widget.onItemRemoved),
                      Text('${widget.itemCount}'),
                      _buildCounterButton(Icons.add, widget.onItemAdded),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(width: 8),
            Text('\$${widget.unitPrice}'),
          ],
        ),
      ),
    );
  }
  Widget _buildImage() {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(8.0),
        bottomLeft: Radius.circular(8.0),
      ),
      child: Container(
        width: 100,
        height: 100,
        child: Image.network(
          imageURLController.text,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildCounterButton(IconData icon, ValueChanged<int> onPressed) {
    return IconButton(
      icon: Icon(icon),
      onPressed: () {
        onPressed(widget.index);
      },
    );
  }
}