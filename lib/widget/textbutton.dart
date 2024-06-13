import 'package:flutter/material.dart';

class TextbuttonWidget extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color? backgroundColor;
  final Color? textColor;

  TextbuttonWidget({
    required this.text,
    required this.onPressed,
    this.backgroundColor,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color?>(
          backgroundColor ?? Colors.transparent,
        ),
        foregroundColor: MaterialStateProperty.all<Color?>(
          textColor ?? Theme.of(context).primaryColor,
        ),
        overlayColor: MaterialStateProperty.resolveWith<Color?>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.hovered)) {
              return Theme.of(context).hoverColor;
            }
            if (states.contains(MaterialState.focused) ||
                states.contains(MaterialState.pressed)) {
              return Theme.of(context).highlightColor;
            }
            return null;
          },
        ),
        shape: MaterialStateProperty.all<OutlinedBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side: BorderSide(
              color: textColor ?? Theme.of(context).primaryColor,
            ),
          ),
        ),
      ),
      child: Text(text),
    );
  }
}

class NavigationButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextbuttonWidget(
          text: "← Previous Question",
          onPressed: () {
            // Handle previous question action
          },
          backgroundColor: Colors.grey.shade200,
          textColor: Colors.black,
        ),
        TextbuttonWidget(
          text: "Next Question →",
          onPressed: () {
            // Handle next question action
          },
          backgroundColor: Colors.teal.shade100,
          textColor: Colors.black,
        ),
      ],
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: Text('Navigation Buttons Example'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: NavigationButtons(),
        ),
      ),
    ),
  ));
}
