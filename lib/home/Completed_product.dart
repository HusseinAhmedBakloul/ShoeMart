import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:signup/home/home_view.dart';

class Completedsuccessfully extends StatelessWidget {
  const Completedsuccessfully({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                LottieBuilder.asset(
                  'Lottie/Animation - 1721677009678.json',
                  height: 400, // Adjust size as needed
                  repeat: true,
                ),
                const Text(
                  'Thank you for completing your order',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 60),
                ElevatedButton(
                  onPressed: () {
                  Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomeView()) 
                ); 
                },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black, 
                    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                  ),
                  child: const Text(
                    'Back to Home',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
      ),
    );
  }
}
