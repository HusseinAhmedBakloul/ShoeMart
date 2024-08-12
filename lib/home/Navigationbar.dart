import 'package:flutter/material.dart';
import 'package:signup/home/MyAccount.dart';
import 'package:signup/home/cartpage.dart';
import 'package:signup/home/home_view.dart';
import 'package:signup/home/my_wish_list.dart';

class Navigationbar extends StatelessWidget {
  const Navigationbar({Key? key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 355,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>  HomeView()),
              );
            },
            icon: Icon(Icons.home, color: Colors.white, size: 32),
          ),
          IconButton(
           onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>  MyWishList()),
              );
            },
            icon: Icon(Icons.favorite, color: Colors.white, size: 32),
          ),
         
          IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>  CartPage()),
              );
            },
            icon: Icon(Icons.shopping_bag, color: Colors.white, size: 32),
          ),
          IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>  MyAccount()),
              );
            },
            icon: Icon(Icons.person, color: Colors.white, size: 32),
          ),
        ],
      ),
    );
  }
}
