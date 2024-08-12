import 'package:flutter/cupertino.dart';

class MywishPageModel extends ChangeNotifier {
  final List<Map<String, dynamic>> _items = [];

  List<Map<String, dynamic>> get items => _items;

  void toggleItem(String name, String description, double price, String image) {
    final index = _items.indexWhere((item) =>
        item['name'] == name && item['description'] == description);

    if (index == -1) {
      _items.add({
        'name': name,
        'description': description,
        'price': price,
        'image': image,
      });
    } else {
      _items.removeAt(index);
    }

    notifyListeners();
  }

  bool isInWishList(String name, String description) {
    return _items.any((item) =>
        item['name'] == name && item['description'] == description);
  }

  void removeItem(int index) {
    if (index >= 0 && index < _items.length) {
      _items.removeAt(index);
      notifyListeners();
    }
  }

  void clear() {
    _items.clear();
    notifyListeners();
  }
}
