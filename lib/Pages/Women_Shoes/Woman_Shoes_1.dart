import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:signup/Models/MyWish_page_model.dart';
import 'package:signup/Models/cartmodel.dart';
import 'package:signup/home/cartpage.dart';
import 'package:signup/home/home_view.dart';

class WomanShoes1 extends StatefulWidget {
  const WomanShoes1({Key? key}) : super(key: key);

  @override
  State<WomanShoes1> createState() => _WomanShoes1State();
}

class _WomanShoes1State extends State<WomanShoes1> {
  int _currentPageIndex = 0;
  int? _selectedSize;

  final List<String> images = [
    'Images/shoes woman/Screenshot_2024-08-10_135118-removebg-preview.png',
    'Images/shoes woman/Screenshot_2024-08-10_135130-removebg-preview.png',
  ];

  final String shoeName = 'High heel shoes';
  final String shoeDescription = 'Woman Shoes';
  final double shoePrice = 700.0;

  @override
  Widget build(BuildContext context) {
    final wishList = Provider.of<MywishPageModel>(context);
    final isFavorite = wishList.isInWishList(shoeName, shoeDescription);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 45),
          _buildTopBar(isFavorite, wishList),
          Expanded(
            child: Stack(
              children: [
                _buildImageSlider(),
                _buildPageIndicator(),
                _buildDetailsSection(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTopBar(bool isFavorite, MywishPageModel wishList) {
    return Container(
      height: 60,
      decoration: const BoxDecoration(color: Colors.transparent),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: const Icon(Icons.close, color: Colors.black, size: 22),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const HomeView()),
              );
            },
          ),
          const Text(
            'Woman Shoes',
            style: TextStyle(
                color: Colors.black,
                fontSize: 23,
                fontWeight: FontWeight.bold),
          ),
          IconButton(
            icon: Icon(
              isFavorite ? Icons.favorite : Icons.favorite_border,
              color: Colors.black,
            ),
            onPressed: () {
              wishList.toggleItem(
                shoeName,
                shoeDescription,
                shoePrice,
                images[_currentPageIndex],
              );
            },
          ),
        ],
      ),
    );
  }

 Widget _buildImageSlider() {
  return Positioned(
    bottom: 470,
    left: 0,
    right: 0,
    child: Container(
      height: 300, 
      child: PageView.builder(
        itemCount: images.length,
        onPageChanged: (index) {
          setState(() {
            _currentPageIndex = index;
          });
        },
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Image.asset(images[index]),
          );
        },
      ),
    ),
  );
}


  Widget _buildPageIndicator() {
    return Positioned(
      bottom: 450,
      left: 0,
      right: 0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(images.length, (index) {
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 5),
            height: 13,
            width: 13,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: _currentPageIndex == index ? Colors.black : Colors.grey,
            ),
          );
        }),
      ),
    );
  }

  Widget _buildDetailsSection() {
    return Positioned(
      top: 330,
      left: 0,
      right: 0,
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(50)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 7,
              spreadRadius: 1,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 30, top: 10),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'High heel Shoes',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 28,
                      fontWeight: FontWeight.bold),
                ),
                const Text(
                  'Shoes Woman',
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                const Text(
                  '\$700.0',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 28,
                      fontWeight: FontWeight.bold),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Row(
                    children: [
                      Text(
                        'Select a size',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '  View size guide',
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Row(
                    children: [41, 42, 43, 44, 45].map((size) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              _selectedSize = size;
                            });
                          },
                          child: Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: _selectedSize == size
                                    ? Colors.blue
                                    : Colors.black,
                              ),
                            ),
                            child: Center(
                              child: Text(
                                '$size',
                                style: TextStyle(
                                  color: _selectedSize == size
                                      ? Colors.blue
                                      : Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 20, right: 85),
                  child: Divider(
                    color: Colors.grey,
                    height: 1,
                    thickness: 1,
                    indent: 50,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Text(
                    'High heel shoes With',
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                const Text(
                  'Cooling Ventilation',
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10,  right: 30),
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
                        'image': images[_currentPageIndex],
                        'size': _selectedSize,
                      });

                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>  CartPage()),
                      );
                    },
                    child: Container(
                      height: 60,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: const Center(
                        child: Text(
                          'Add to bag',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
