import 'package:flutter/material.dart';

class EmailSet extends StatefulWidget {
  @override
  EmailSetState createState() => EmailSetState();
}

class EmailSetState extends State<EmailSet> {
  TextEditingController emailController =
      TextEditingController(text: 'meng2321@gmail.com');

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Email",
            style: TextStyle(
              color: Colors.black87.withOpacity(0.8),
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 10),
          TextField(
            controller: emailController,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              filled: true,
              fillColor: Colors.grey.shade300,
              contentPadding: EdgeInsets.all(10),
            ),
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
        title: Text('Email Field Example'),
      ),
      body: EmailSet(),
    ),
  ));
}
