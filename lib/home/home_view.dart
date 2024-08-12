import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:signup/ALL_men/AllContainers.dart';
import 'package:signup/Categories/Bags.dart';
import 'package:signup/Categories/Categories_name.dart';
import 'package:signup/Categories/Containers_men.dart';
import 'package:signup/Categories/Containers_woman.dart';
import 'package:signup/home/LatestShoes.dart';
import 'package:signup/home/Navigationbar.dart';


class HalfClippedRectClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height / 5);
    path.cubicTo(
      size.width / 4,
      3 * (size.height / 6),
      3 * (size.width / 4),
      size.height / 6,
      size.width,
      size.height * 0.3, 
    );
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late Widget container;

  @override
  void initState() {
    super.initState();
    container = const Containersmen();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          ClipPath(
            clipper: HalfClippedRectClipper(),
            child: Container(
              color: Colors.black,
              height: double.infinity,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 40, left: 20),
            child: Text(
              'Athletic Shoes',
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.bold,
                fontFamily: 'Teko'
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 68, left: 20),
            child: Text(
              'Collection',
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.bold,
                fontFamily: 'Teko'
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 95),
            child: CategoriesName(
              updateSelectedCategory: updateSelectedCategory,
              selectedCategory: '',
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 170),
            child: container,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 615, left: 20),
            child: Text(
              'Latest Shoes',
              style: TextStyle(
                color: Colors.black,
                fontSize: 25,
                fontWeight: FontWeight.bold,
                fontFamily: 'Oswald'
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 620, left: 280),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AllContainers()),
                );
              },
              child: Row(
                children: [
                  Text(
                    'Show all',
                    style: TextStyle(color: Colors.grey,fontSize: 20,fontWeight: FontWeight.bold, fontFamily: 'Oswald'),
                  ),
                  Icon(Icons.arrow_downward_sharp, color: Colors.grey)
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 670, left: 20),
            child: LatestShoes(),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 780, left: 20),
            child: Navigationbar(),
          ),
        ],
      ),
    );
  }

  void updateSelectedCategory(String category) {
    setState(() {
      if (category == 'men') {
        container = const Containersmen();
      } else if (category == 'women') {
        container = const Containerswoman();
      } else if (category == 'accessories') {
        container = const ContainersAccessories();
      }
    });
  }
}
