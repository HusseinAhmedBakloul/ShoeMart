import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:signup/Models/Account_model.dart';
import 'package:signup/Models/MyWish_page_model.dart';
import 'package:signup/Models/cartmodel.dart';
import 'package:signup/login/Auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "AIzaSyCO9OQNQEO2kRyHmgUvfHdlbXHNNUMwiRA",
      appId: "1:451010889778:web:6f4244b01ef519433cd42b",
      messagingSenderId: "451010889778",
      projectId: "fir-shoemart-6bb19",
    ),
  );

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CartModel()),
        ChangeNotifierProvider(create: (_) => MywishPageModel()), 
        ChangeNotifierProvider(create: (_) => AccountModel()), 
      ],
      child: ShoeMart(),
    ),);
}

class ShoeMart extends StatelessWidget {
  const ShoeMart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Auth(),
    );
  }
}