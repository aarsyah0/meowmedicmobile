import 'package:flutter/material.dart';

class TitleWidget extends StatefulWidget {
  @override
  TitleState createState() => TitleState();
}

class TitleState extends State<TitleWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: 16.0), // Reduced horizontal padding
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center, // Center the content
        children: [
          Text(
            "Please choose the symptoms that match your pet's conditions",
            textAlign: TextAlign.center, // Center-align the text
            style: TextStyle(
              color: Colors.black87.withOpacity(0.8),
              fontSize: 25,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            height: 2,
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(title: Text('Centered Title Example')),
      body: Center(
        child: TitleWidget(), // Center the entire TitleWidget
      ),
    ),
  ));
}
