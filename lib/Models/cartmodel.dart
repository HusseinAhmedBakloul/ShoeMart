import 'package:flutter/foundation.dart';

class CartModel extends ChangeNotifier {
  List<Map<String, dynamic>> items = [];

  double get totalPrice =>
      items.fold(0, (total, item) => total + item['price'] * item['quantity']);

  void addItem(Map<String, dynamic> newItem) {
    items.add(newItem);
    notifyListeners();
  }

  void removeItem(int index) {
    items.removeAt(index);
    notifyListeners();
  }
}
