import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:signup/home/home_view.dart';
import 'package:signup/login/SignUp.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  bool _obscureText = true;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  String _errorMessage = '';
  bool _hasError = false;

  Future<void> login() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeView()), 
      );
    } catch (e) {
      setState(() {
        _errorMessage = 'Check your email or password';
        _hasError = true;
      });
      print('Failed to sign in: $e');
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 15, left: 15, top: 90),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const HomeView()), // Replace HomeView with your actual home screen widget
                  );
                },
                child: Container(
                  height: 300,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('Images/footwear-shoes-production-isometric-composition-with-view-designers-workplace-with-computer-shoes-shelves-illustration_1284-62044-removebg-preview.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
            const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Shoe',
                  style: TextStyle(color: Colors.black, fontSize: 34, fontWeight: FontWeight.bold, fontFamily: 'AbrilFatface'),
                ),
                Text(
                  'Mart',
                  style: TextStyle(color: Color.fromARGB(255, 141, 138, 138), fontSize: 34, fontWeight: FontWeight.bold, fontFamily: 'AbrilFatface'),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25,),
                child: Container(
                  height: 270,
                  width: double.infinity,
                  decoration : BoxDecoration(
                    color:Colors.black.withOpacity(.08), 
                    borderRadius: BorderRadius.circular(32)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 25),
                    child: Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                        children: [
                        Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const SignUp()), 
                            );
                          },
                          child: Container(
                            height: 60,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(78, 226, 225, 225),
                              borderRadius: BorderRadius.circular(30),
                              border: Border.all(
                                width: 1,
                                color: _hasError ? Colors.red : Colors.black,
                              ),
                            ),
                            child: Row(
                              children: [
                                const Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 15),
                                  child: Icon(Icons.email, color: Colors.black, size: 24),
                                ),
                                Expanded(
                                  child: TextFormField(
                                    controller: _emailController,
                                    decoration: InputDecoration(
                                      hintText: 'Enter your email',
                                      hintStyle: TextStyle(color: Color.fromARGB(255, 141, 138, 138)),
                                      border: InputBorder.none,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                       Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Container(
                          height: 60,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(78, 226, 225, 225),
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(
                              width: 1,
                              color: _hasError ? Colors.red : Colors.black,
                            ),
                          ),
                          child: Row(
                            children: [
                              const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 15),
                                child: Icon(Icons.lock, color: Colors.black, size: 24),
                              ),
                              Expanded(
                                child: TextFormField(
                                  controller: _passwordController,
                                  obscureText: _obscureText,
                                  decoration: InputDecoration(
                                    hintText: 'Enter your password',
                                    hintStyle: TextStyle(color: Color.fromARGB(255, 141, 138, 138)),
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child: IconButton(
                                  icon: Icon(
                                    _obscureText ? Icons.visibility : Icons.visibility_off,
                                    color: Colors.black,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      _obscureText = !_obscureText;
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                          ),
                                      const SizedBox(height: 20,),
                                      if (_hasError) ...[
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 40),
                          child: Text(
                            _errorMessage,
                            style: TextStyle(color: Colors.red, fontSize: 14),
                          ),
                        ),
                        const SizedBox(height: 10,),
                               ],
                                          Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor:  Colors.black,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            minimumSize: const Size(double.infinity, 60),
                          ),
                          onPressed: () {
                            login(); 
                          },
                          child: const Text(
                              'Login',
                               style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)),
                        ),
                                      ),
                                      ]),
                      ),
                    ),
                  )
                          ),
              ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "If you haven't account?",
                  style: TextStyle(color: Color.fromARGB(255, 141, 138, 138), fontSize: 15, fontWeight: FontWeight.bold),
                ),
                SizedBox(width: 8),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const SignUp()),
                    );
                  },
                    child: const Text(
                      "Sign Up",
                      style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold,decoration: TextDecoration.underline,decorationColor: Colors.black,
                      ),
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
