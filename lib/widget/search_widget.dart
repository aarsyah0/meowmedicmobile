import 'package:flutter/material.dart';
import 'banner_widget.dart';
// Import file banner_widget.dart yang baru saja kita buat

class SearchWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: 16.0), // Add padding to the entire search widget
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            height: 50,
            decoration: BoxDecoration(
              color: Color(0xffEFEFEF),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Row(
              children: <Widget>[
                Icon(Icons.search),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "Search diagnosis",
                  style: TextStyle(color: Colors.grey, fontSize: 19),
                )
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(title: Text('Search Widget Example')),
      body: Center(
        child: Column(
          children: [
            BannerWidget(), // Assume you have imported and created the BannerWidget
            SearchWidget(),
          ],
        ),
      ),
    ),
  ));
}
