import 'package:flutter/material.dart';

class CategoriesName extends StatefulWidget {
  final Function(String) updateSelectedCategory;
  const CategoriesName({Key? key, required this.updateSelectedCategory, required String selectedCategory})
      : super(key: key);

  @override
  _CategoriesNameState createState() => _CategoriesNameState();
}

class _CategoriesNameState extends State<CategoriesName> {
  String selectedCategory = 'men';

  @override
  void initState() {
    super.initState();
    selectedCategory = 'men';
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                selectedCategory = 'men';
              });
              widget.updateSelectedCategory('men');
            },
            child: Padding(
              padding: const EdgeInsets.only(top: 30, left: 20),
              child: Text(
                'Men Shoes',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: selectedCategory == 'men' ? Colors.white : Colors.grey,
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                selectedCategory = 'women';
              });
              widget.updateSelectedCategory('women');
            },
            child: Padding(
              padding: const EdgeInsets.only(top: 30, left: 30),
              child: Text(
                'Women Shoes',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: selectedCategory == 'women' ? Colors.white : Colors.grey,
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                selectedCategory = 'accessories';
              });
              widget.updateSelectedCategory('accessories');
            },
            child: Padding(
              padding: const EdgeInsets.only(top: 30, left: 25),
              child: Text(
                'Bags',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: selectedCategory == 'accessories' ? Colors.white : Colors.grey,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
