import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:signup/Models/MyWish_page_model.dart';
import 'package:signup/Pages/Bags/Bags_1.dart';
import 'package:signup/Pages/Bags/Bags_2.dart';

class ContainersAccessories extends StatelessWidget {
  const ContainersAccessories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Bags1()) 
                ); 
            },
            child: AccessoryContainer(
              imageUrl: 'Images/Accessories/Screenshot_2024-08-10_150840-removebg-preview.png',
              title: 'Beautiful elegance',
              subTitle: 'and luxury',
              price: '\$600',
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Bags2()) 
                ); 
            },
            child: AccessoryContainer(
              imageUrl: 'Images/Accessories/Screenshot_2024-08-10_152904-removebg-preview.png',
              title: 'blue',
              subTitle: 'Handbag',
              price: '\$500',
            ),
          ),
        ],
      ),
    );
  }
}

class AccessoryContainer extends StatefulWidget {
  final String imageUrl;
  final String title;
  final String subTitle;
  final String price;

  const AccessoryContainer({
    Key? key,
    required this.imageUrl,
    required this.title,
    required this.subTitle,
    required this.price,
  }) : super(key: key);

  @override
  _AccessoryContainerState createState() => _AccessoryContainerState();
}

class _AccessoryContainerState extends State<AccessoryContainer> {
  
  String get shoeName => widget.title;
  String get shoeDescription => 'High quality shoes'; 
  double get shoePrice => double.parse(widget.price.replaceAll('\$', ''));

  @override
  Widget build(BuildContext context) {
    final wishList = Provider.of<MywishPageModel>(context);
    final isFavorite = wishList.isInWishList(shoeName, shoeDescription);
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 10),
      child: Container(
        height: 430,
        width: 330,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
          border: Border.all(width: .8, color: Colors.grey),
        ),
        child: Stack(
          children: [
            Positioned(
              top: 10,
              right: 10,
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
              top: 40,
              bottom: 180,
              right: 25,
              left: 25,
              child: Image.asset(widget.imageUrl),
            ),
            Positioned(
              top: 270,
              left: 25,
              child: Text(
                widget.title,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Positioned(
              top: 305,
              left: 25,
              child: Text(
                widget.subTitle,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Positioned(
              top: 350,
              left: 25,
              child: Text(
                'News handbag',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Positioned(
              top: 380,
              left: 25,
              child: Text(
                widget.price,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
