import 'package:flutter/material.dart';

class ScrollHistoryWidget extends StatelessWidget {
  final List<String> historyItems;

  ScrollHistoryWidget({required this.historyItems});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true, // Makes the ListView take only the necessary space
      itemCount: historyItems.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 4,
                  spreadRadius: 2,
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    historyItems[index],
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Lorem ipsum dolor sit amet, consectetur',
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

void main() {
  List<String> historyItems = [
    "Today",
    "Yesterday",
    "Wed, 7 Nov",
    "Thu, 8 Nov"
  ];

  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(title: Text('Scrollable History')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 4,
                spreadRadius: 2,
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ScrollHistoryWidget(historyItems: historyItems),
          ),
        ),
      ),
    ),
  ));
}
