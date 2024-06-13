import 'package:flutter/material.dart';

class PasswordSet extends StatefulWidget {
  @override
  PasswordSetState createState() => PasswordSetState();
}

class PasswordSetState extends State<PasswordSet> {
  TextEditingController passwordController =
      TextEditingController(text: '************');

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Password",
            style: TextStyle(
              color: Colors.black87.withOpacity(0.8),
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(
              height:
                  10), // Adjusted the height to add space between label and text field
          TextField(
            controller: passwordController,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              filled: true,
              fillColor: Colors.grey.shade300,
              contentPadding: EdgeInsets.all(10),
            ),
            obscureText: true,
            style: TextStyle(
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: Text('Password Field Example'),
      ),
      body: PasswordSet(),
    ),
  ));
}
