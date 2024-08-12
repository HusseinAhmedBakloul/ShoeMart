import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AccountModel with ChangeNotifier {
  String _name = '';
  String _email = '';
  String _password = '';
  String _phone = '';
  String _address = '';
  String _imagePath = '';

  String get name => _name;
  String get email => _email;
  String get password => _password;
  String get phone => _phone;
  String get address => _address;
  String get imagePath => _imagePath;

  Future<void> updateAccount(
    String name,
    String email,
    String password,
    String phone,
    String address,
    String imagePath,
  ) async {
    _name = name;
    _email = email;
    _password = password;
    _phone = phone;
    _address = address;
    _imagePath = imagePath;

    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('name', _name);
    await prefs.setString('email', _email);
    await prefs.setString('password', _password);
    await prefs.setString('phone', _phone);
    await prefs.setString('address', _address);
    await prefs.setString('imagePath', _imagePath);

    notifyListeners();
  }
}
