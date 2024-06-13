import 'package:flutter/material.dart';
import 'widget/bannerset.dart';
import 'widget/emailset.dart';
import 'widget/passwordset.dart';

class SettingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          print("Constraints: $constraints");
          return SingleChildScrollView(
            child: Column(
              children: [
                SetBannerWidget(),
                EmailSet(),
                SizedBox(
                    height:
                        0), // Menghilangkan jarak antara PasswordSet dan EmailSet
                PasswordSet(), // Your widget tree here
              ],
            ),
          );
        },
      ),
    );
  }
}
