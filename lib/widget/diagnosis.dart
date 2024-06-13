import 'package:flutter/material.dart';

class DiagnosisWidget extends StatefulWidget {
  @override
  DiagnosisState createState() => DiagnosisState();
}

class DiagnosisState extends State<DiagnosisWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Diagnosis",
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
