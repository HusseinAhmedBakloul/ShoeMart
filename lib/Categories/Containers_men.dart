import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:signup/Models/MyWish_page_model.dart';
import 'package:signup/Pages/Men_Shose/Men_Shoes_1.dart';
import 'package:signup/Pages/Men_Shose/Men_Shoes_2.dart';

class Containersmen extends StatelessWidget {
  const Containersmen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [ 
        GestureDetector(
         onTap: () {
           Navigator.push( context,
           MaterialPageRoute( builder: (context) =>  MenShoes1(),
      ),
    );
  },
          child: MenContainer(
          imageUrl: 'Images/shoes men/Screenshot 2024-05-06 020831.png',
          title: 'Sport Running',
          subTitle: 'Shoes',
          price: '\$500.0',
        ),
       ),
        GestureDetector(
         onTap: () {
           Navigator.push( context,
           MaterialPageRoute( builder: (context) =>  MenShoes2(),
         ),
        );
        },
            child: MenContainer(
              imageUrl: 'Images/shoes men/Screenshot 2024-04-09 001313.png',
              title: 'Leather Boots',
              subTitle: 'Shoes',
              price: '\$560.0',
            ),
          ),
        ],
      ),
    );
  }
}

class MenContainer extends StatefulWidget {
  final String imageUrl;
  final String title;
  final String subTitle;
  final String price;

  const MenContainer({
    Key? key,
    required this.imageUrl,
    required this.title,
    required this.subTitle,
    required this.price,
  }) : super(key: key);

  @override
  _MenContainerState createState() => _MenContainerState();
}

class _MenContainerState extends State<MenContainer> {

  String get shoeName => widget.title;
  String get shoeDescription => 'High quality shoes'; 
  double get shoePrice => double.parse(widget.price.replaceAll('\$', ''));


  @override
  Widget build(BuildContext context) {
    final wishList = Provider.of<MywishPageModel>(context);
    final isFavorite = wishList.isInWishList(shoeName, shoeDescription);
    return  Padding(
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
              top: 30,
              bottom: 180,
              right: 20,
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
                'News Shoes',
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
