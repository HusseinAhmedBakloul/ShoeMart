import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:signup/Models/MyWish_page_model.dart';
import 'package:signup/Models/cartmodel.dart';
import 'package:signup/home/cartpage.dart';

class ALLMen extends StatelessWidget {
  const ALLMen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: const [
              AllMenContainer(
                imageUrl: 'Images/shoes men/3.png',
                title: 'Doc Martens',
                price: '\$650.0',
              ),
              AllMenContainer(
                imageUrl: 'Images/shoes men/2.png',
                title: 'Timberland',
                price: '\$300.0',
              ),
              AllMenContainer(
                imageUrl: 'Images/shoes men/1.png',
                title: 'Salomon',
                price: '\$650.0',
              ),
            ],
          ),
          Column(
            children: const [
              AllMenContainer(
                imageUrl: 'Images/shoes men/4.png',
                title: 'Burberry',
                price: '\$450.0',
              ),
              AllMenContainer(
                imageUrl: 'Images/shoes men/5.png',
                title: 'Balenciaga',
                price: '\$400.0',
              ),
              AllMenContainer(
                imageUrl: 'Images/shoes men/Screenshot 2024-04-14 214922.png',
                title: 'Gucci',
                price: '\$500.0',
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class AllMenContainer extends StatefulWidget {
  final String imageUrl;
  final String title;
  final String price;

  const AllMenContainer({
    Key? key,
    required this.imageUrl,
    required this.title,
    required this.price,
  }) : super(key: key);

  @override
  _AllMenContainerState createState() => _AllMenContainerState();
}

class _AllMenContainerState extends State<AllMenContainer> {
  int? _selectedSize;

  String get shoeName => widget.title;
  String get shoeDescription => 'High quality shoes'; 
  double get shoePrice => double.parse(widget.price.replaceAll('\$', ''));

  @override
  Widget build(BuildContext context) {
    final wishList = Provider.of<MywishPageModel>(context);
    final isFavorite = wishList.isInWishList(shoeName, shoeDescription);

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
                      shoeName,
                      shoeDescription,
                      shoePrice,
                      widget.imageUrl,
                    );
                  });
                },
              ),
            ),
            Positioned(
              top: 25,
              bottom: 40,
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
                    'name': shoeName,
                    'description': shoeDescription,
                    'price': shoePrice,
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
                items: [38, 39, 40, 41, 42, 43, 44, 45].map((int size) {
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
