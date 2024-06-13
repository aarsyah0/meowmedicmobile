import 'package:flutter/material.dart';
import 'widget/textbutton.dart';
import 'widget/diagnosis.dart';
import 'widget/title.dart';
import 'widget/question.dart';

class DiagnosisScreen extends StatelessWidget {
  void handleButtonPress() {
    // Placeholder function, do nothing for now
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          print("Constraints: $constraints");
          return SingleChildScrollView(
            child: Column(
              children: [
                DiagnosisWidget(),
                TitleWidget(),
                QuestionWidget(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextbuttonWidget(
                      text: 'Text',
                      onPressed: handleButtonPress,
                    ),
                    TextbuttonWidget(
                      text: 'Start',
                      onPressed: handleButtonPress,
                    ),
                  ],
                ),
                // Your widget tree here
              ],
            ),
          );
        },
      ),
    );
  }
}
