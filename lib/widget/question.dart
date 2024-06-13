import 'package:flutter/material.dart';

class QuestionWidget extends StatefulWidget {
  @override
  QuestionState createState() => QuestionState();
}

class QuestionState extends State<QuestionWidget> {
  int _selectedOption = -1;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "1. Has your cat vomited in the last 2 hours?",
            style: TextStyle(
              color: Colors.black87.withOpacity(0.8),
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RadioListTile(
                title: Text(
                  "Yes",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                value: 0,
                groupValue: _selectedOption,
                onChanged: (value) {
                  setState(() {
                    _selectedOption = value as int;
                  });
                },
              ),
              RadioListTile(
                title: Text(
                  "No",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                value: 1,
                groupValue: _selectedOption,
                onChanged: (value) {
                  setState(() {
                    _selectedOption = value as int;
                  });
                },
              ),
            ],
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
        title: Text('Cat Health Survey'),
      ),
      body: QuestionWidget(),
    ),
  ));
}
