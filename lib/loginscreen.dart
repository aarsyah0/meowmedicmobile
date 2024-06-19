import 'package:flutter/material.dart';

import 'auth_service.dart';
import 'signupscreen.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final AuthService authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        resizeToAvoidBottomInset: true,
        body: Stack(
          children: [
            Container(
              color: Colors.white,
            ),
            Positioned(
              top: 0,
              left: 0,
              child: Image.asset(
                'assets/images/bloblogin.png',
                fit: BoxFit.cover,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.45,
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height * 0.1,
              left: 40,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Paws for a moment and\nwelcome to our cozy\ncorner!🐾',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                ],
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height * 0.45,
              left: 0,
              right: 0,
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextFieldWidget(
                      controller: usernameController,
                      icon: Icons.email,
                      hintText: 'Username',
                      textColor: Colors.grey,
                    ),
                    SizedBox(height: 6),
                    TextFieldWidget(
                      controller: passwordController,
                      icon: Icons.lock,
                      hintText: 'Password',
                      textColor: Colors.grey,
                      obscureText: true,
                    ),
                    SizedBox(height: 20),
                    CustomButton(
                      text: 'Login',
                      backgroundColor: Color(0xFFA9E2E4),
                      textColor: const Color.fromRGBO(48, 51, 52, 1),
                      onPressed: () async {
                        final username = usernameController.text;
                        final password = passwordController.text;
                        final success =
                            await authService.login(username, password);
                        if (success) {
                          Navigator.of(context).pushReplacementNamed('/home');
                        } else {
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: Text('Login Error'),
                              content:
                                  Text('Failed to login. Please try again.'),
                              actions: [
                                TextButton(
                                  onPressed: () => Navigator.of(context).pop(),
                                  child: Text('OK'),
                                ),
                              ],
                            ),
                          );
                        }
                      },
                    ),
                    SizedBox(height: 16),
                    CustomButton(
                      text: 'Sign Up',
                      backgroundColor: Color(0xFFFB7E5E),
                      textColor: const Color.fromRGBO(255, 255, 255, 1),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (_) => SignUpScreen(),
                        ));
                      },
                    ),
                    SizedBox(height: 25),
                    Container(
                      height: 2,
                      width: MediaQuery.of(context).size.width * 0.2,
                      color: Colors.grey,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TextFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final IconData icon;
  final String hintText;
  final Color textColor;
  final bool obscureText;

  const TextFieldWidget({
    Key? key,
    required this.controller,
    required this.icon,
    required this.hintText,
    this.textColor = Colors.grey,
    this.obscureText = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
        color: Colors.white,
        border: Border.all(color: Colors.grey, width: 2),
      ),
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Icon(
            icon,
            color: const Color.fromRGBO(158, 158, 158, 1),
          ),
          SizedBox(width: 10),
          Expanded(
            child: TextField(
              controller: controller,
              obscureText: obscureText,
              style: TextStyle(),
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: hintText,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final String text;
  final Color backgroundColor;
  final Color textColor;
  final VoidCallback onPressed;

  const CustomButton({
    Key? key,
    required this.text,
    required this.backgroundColor,
    required this.textColor,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        primary: backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40),
        ),
        padding: EdgeInsets.symmetric(vertical: 14),
        elevation: 10,
        shadowColor: Colors.black.withOpacity(0.3),
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            color: textColor,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
