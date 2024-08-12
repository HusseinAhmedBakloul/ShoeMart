import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:signup/Models/MyWish_page_model.dart';
import 'package:signup/Models/cartmodel.dart';
import 'package:signup/home/cartpage.dart';

class ALLAccessories extends StatelessWidget {
  const ALLAccessories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              ALLAccessoriesContainers(
                imageUrl: 'Images/Accessories/Screenshot 2024-05-06 005423.png',
                title: 'Zein',
                price: '\$720.00',
              ),
              ALLAccessoriesContainers(
                imageUrl: 'Images/Accessories/Screenshot 2024-05-06 005442.png',
                title: 'Judith Leiber',
                price: '\$650.00',
              ),
              ALLAccessoriesContainers(
                imageUrl: 'Images/Accessories/Screenshot 2024-05-06 005516.png',
                title: 'May',
                price: '\$600.00',
              ),
            ],
          ),
          Column(
            children: [
              ALLAccessoriesContainers(
                imageUrl: 'Images/Accessories/Screenshot 2024-05-06 005516.png',
                title: 'May Jacobs',
                price: '\$500.00',
              ),
              ALLAccessoriesContainers(
                imageUrl: 'Images/Accessories/Screenshot 2024-05-06 005629.png',
                title: 'My Way',
                price: '\$800.00',
              ),
              ALLAccessoriesContainers(
                imageUrl: 'Images/Accessories/Screenshot 2024-05-06 005705.png',
                title: 'Julia Walekot',
                price: '\$700.00',
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ALLAccessoriesContainers extends StatefulWidget {
  final String imageUrl;
  final String title;
  final String price;

  const ALLAccessoriesContainers({
    Key? key,
    required this.imageUrl,
    required this.title,
    required this.price,
  }) : super(key: key);

  @override
  _ALLAccessoriesContainersState createState() => _ALLAccessoriesContainersState();
}

class _ALLAccessoriesContainersState extends State<ALLAccessoriesContainers> {
  int? _selectedSize;

  String get accessoryName => widget.title;
  String get accessoryDescription => 'Stylish and high-quality accessory'; 
  double get accessoryPrice => double.parse(widget.price.replaceAll('\$', ''));

  @override
  Widget build(BuildContext context) {
    final wishList = Provider.of<MywishPageModel>(context);
    final isFavorite = wishList.isInWishList(accessoryName, accessoryDescription);

    return Padding(
      padding: const EdgeInsets.only(left: 20, bottom: 20),
      child: Container(
        height: 270,
        width: 165,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
          border: Border.all(width: .4, color: Colors.grey),
        ),
        child: Stack(
          children: [
            Positioned(
              top: 5,
              right: 0,
              child: IconButton(
                icon: Icon(
                  isFavorite ? Icons.favorite : Icons.favorite_border,
                  color: isFavorite ? Colors.red : Colors.black,
                ),
                onPressed: () {
                  setState(() {
                    wishList.toggleItem(
                      accessoryName,
                      accessoryDescription,
                      accessoryPrice,
                      widget.imageUrl,
                    );
                  });
                },
              ),
            ),
            Positioned(
              top: 55,
              bottom: 85,
              right: 5,
              left: 5,
              child: Image.asset(widget.imageUrl),
            ),
            Positioned(
              top: 190,
              left: 10,
              child: Text(
                widget.title,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Positioned(
              top: 225,
              left: 10,
              child: Text(
                widget.price,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Positioned(
              bottom: 5,
              right: 5,
              child: GestureDetector(
                onTap: () {
                  if (_selectedSize == null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Please select a size.')),
                    );
                    return;
                  }

                  Provider.of<CartModel>(context, listen: false).addItem({
                    'name': accessoryName,
                    'description': accessoryDescription,
                    'price': accessoryPrice,
                    'quantity': 1,
                    'image': widget.imageUrl,
                    'size': _selectedSize,
                  });

                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>  CartPage()),
                  );
                },
                child: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: const Color.fromARGB(255, 235, 229, 229),
                    border: Border.all(width: .4, color: Colors.black),
                  ),
                  child: const Icon(Icons.add_shopping_cart, color: Colors.black),
                ),
              ),
            ),
            Positioned(
              top: 5,
              left: 10,
              child: DropdownButton<int>(
                hint: const Text('Size'),
                value: _selectedSize,
                items: [12, 13, 15, 16, 17, 18].map((int size) {
                  return DropdownMenuItem<int>(
                    value: size,
                    child: Text(size.toString()),
                  );
                }).toList(),
                onChanged: (int? newValue) {
                  setState(() {
                    _selectedSize = newValue;
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
