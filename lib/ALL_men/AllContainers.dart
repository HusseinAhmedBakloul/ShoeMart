import 'package:flutter/material.dart';
import 'package:signup/ALL_men/All_Accosseries_containers.dart';
import 'package:signup/ALL_men/All_men_containers.dart';
import 'package:signup/ALL_men/All_woman_containers%20.dart';
import 'package:signup/Categories/Categories_name.dart';
import 'package:signup/home/home_view.dart';

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

class AllContainers extends StatefulWidget {
  const AllContainers({Key? key}) : super(key: key);

  @override
  _AllContainersState createState() => _AllContainersState();
}

class _AllContainersState extends State<AllContainers> {
  late Widget container;

  @override
  void initState() {
    super.initState();
    container = const ALLMen();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned.fill(
            child: ClipPath(
              clipper: HalfClippedRectClipper(),
              child: Container(
                color: Colors.black,
                height: double.infinity, 
              ),
            ),
          ),
          Positioned(
            top: 70,
            child: CategoriesName(updateSelectedCategory: updateSelectedCategory, selectedCategory: '',),
          ),
          Positioned.fill(
            top: 140, 
            child: container, 
          ),
          Positioned(
            top: 35,
            left: 10,
            child: IconButton(
              icon: Icon(Icons.close, color: Colors.white, size: 25,),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => HomeView()),
                );
              },
            ),
          ),
          Positioned(
            top: 40,
            right: 110,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text('All Products', style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold, fontFamily: 'Teko'),),
              ),
            ),
        ],
      ),
    );
  }

  void updateSelectedCategory(String category) {
    setState(() {
      if (category == 'men') {
        container = const ALLMen();
      }
      else if (category == 'women') {
        container = const ALLWoman();
      }
      else if (category == 'accessories') {
        container = const ALLAccessories();
      }
    });
  }
}
