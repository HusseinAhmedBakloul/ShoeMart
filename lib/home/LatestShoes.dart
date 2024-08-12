import 'package:flutter/material.dart';
import 'package:signup/Latest_Shoes/LatestShoes1.dart';
import 'package:signup/Latest_Shoes/LatestShoes2.dart';
import 'package:signup/Latest_Shoes/LatestShoes3.dart';
import 'package:signup/Latest_Shoes/LatestShoes4.dart';

class LatestShoes extends StatelessWidget {
  final List<String> images = [
    'Images/shoes men/Screenshot 2024-08-10 203224.png',
    'Images/shoes men/Screenshot 2024-08-10 204541.png',
    'Images/shoes woman/Screenshot_2024-08-10_205100-removebg-preview.png',
    'Images/Accessories/Screenshot_2024-08-10_211348-removebg-preview.png',
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: images.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 25),
            child: GestureDetector(
              onTap: () {
                switch (index) {
                  case 0:
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Latestshoes1(),
                      ),
                    );
                    break;
                  case 1:
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Latestshoes2(),
                      ),
                    );
                    break;
                  case 2:
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LatestShoes3(),
                      ),
                    );
                    break;
                  case 3:
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LatestShoes4(),
                      ),
                    );
                    break;
                }
              },
              child: Container(
                height: 90,
                width: 90,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.white,
                  border: Border.all(width: .8, color: Colors.grey),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    images[index],
                    fit: BoxFit.fill ,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

