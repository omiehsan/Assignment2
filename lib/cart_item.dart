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
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        // color: Colors.deepOrangeAccent,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: Row(
            children: [
              _buildImage(),
              const SizedBox(width: 8),
              Flexible(
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(widget.productName,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold, fontSize: 16)),
                              Opacity(
                                opacity: 0.5,
                                child: Material(
                                  shape: const CircleBorder(),
                                  child: IconButton(
                                    onPressed: () {},
                                    icon: const Icon(Icons.more_vert_rounded),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Opacity(
                                        opacity: 0.5,
                                        child: Text('Color: ',
                                            style: TextStyle(fontSize: 11))),
                                    Text('${widget.productColor}',
                                        style: TextStyle(fontSize: 11)),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Opacity(
                                        opacity: 0.5,
                                        child: Text('Size: ',
                                            style: TextStyle(fontSize: 11))),
                                    Text('${widget.productSize}',
                                        style: TextStyle(fontSize: 11)),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                  ],
                                ),
                              ),
                            ],

                          ),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Opacity(
                                      opacity: 0.5,
                                      child: Material(
                                          shape: const CircleBorder(),
                                          elevation: 1.5,
                                          child: _buildCounterButton(
                                              Icons.remove, widget.onItemRemoved))),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text('${widget.itemCount}',style:TextStyle(fontSize: 14)),
                                  ),
                                  Opacity(
                                      opacity: 0.5,
                                      child: Material(
                                          shape: const CircleBorder(),
                                          elevation: 1.5,
                                          child: _buildCounterButton(
                                              Icons.add, widget.onItemAdded))),
                                ],
                              ),
                              Text('\$${widget.unitPrice}',style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildImage() {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(8.0),
        bottomLeft: Radius.circular(8.0),
      ),
      child: Container(
        width: 109,
        height: 109,
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
