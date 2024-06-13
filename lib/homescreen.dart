import 'package:flutter/material.dart';
import 'widget/banner_widget.dart';
import 'widget/diagnostic_history.dart';
import 'widget/search_widget.dart';
import 'widget/scroll_history.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<String> historyItems = [
      "Item 1",
      "Item 2",
      "Item 3",
      "Item 4",
      "Item 5",
      "Item 6",
      "Item 7",
      "Item 8",
      "Item 9",
      "Item 10"
    ];
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            BannerWidget(),
            SizedBox(
                height:
                    70), // Menambahkan SizedBox untuk memberikan jarak dengan BannerWidget
            DiagnosticHistoryWidget(),
            SearchWidget(), // Widget lain yang ada dalam HomeScreen
            SizedBox(height: 20),
            ScrollHistoryWidget(
                historyItems: historyItems), // Berikan nilai historyItems
            SizedBox(height: 20),
            // Widget lain yang ada dalam HomeScreen
            // Memanggil widget banner
            // Tambahkan widget lain sesuai kebutuhan
          ],
        ),
      ),
    );
  }
}
