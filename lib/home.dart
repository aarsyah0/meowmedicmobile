import 'package:flutter/material.dart';
import 'package:sliding_clipped_nav_bar/sliding_clipped_nav_bar.dart'; // Ensure you have this package in your pubspec.yaml

import 'diagnosis.dart'; // Import the DiagnosaPage class
import 'homescreen.dart'; // Import the HomeScreen class
import 'user_detail_page.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int selectedIndex = 0;
  late final PageController controller;

  @override
  void initState() {
    super.initState();
    controller = PageController();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void navigateToDiagnosaPage(
      String nik,
      String namaPemilik,
      String noHp,
      String alamat,
      String namaPeliharaan,
      String jekel,
      int? umur,
      double? berat,
      double? suhu) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DiagnosaPage(
          nik: nik,
          namaPemilik: namaPemilik,
          noHp: noHp,
          alamat: alamat,
          namaPeliharaan: namaPeliharaan,
          jekel: jekel,
          umur: umur,
          berat: berat,
          suhu: suhu,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        elevation: 0,
        title: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Text(
                'meow medic',
                style: TextStyle(
                    color: const Color.fromARGB(255, 0, 0, 0),
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: Image.asset(
                'assets/images/meow.png', // Make sure this image asset is in your project
                height: 40,
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Container(
            height: 2,
            color: Color.fromARGB(255, 209, 209, 209),
          ),
          Expanded(
            child: PageView(
              physics: NeverScrollableScrollPhysics(),
              controller: controller,
              children: [
                HomeScreen(), // Use the HomeScreen here
                UserDetailPage(
                  onSubmit: navigateToDiagnosaPage, // Pass callback function
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: SlidingClippedNavBar.colorful(
        backgroundColor: Color.fromARGB(255, 255, 253, 251),
        onButtonPressed: (index) {
          setState(() {
            selectedIndex = index;
          });
          controller.animateToPage(
            selectedIndex,
            duration: const Duration(milliseconds: 400),
            curve: Curves.easeOutQuad,
          );
        },
        iconSize: 30,
        selectedIndex: selectedIndex,
        barItems: [
          BarItem(
            icon: Icons.home,
            title: 'Home',
            activeColor: const Color(0xFFFB7E5E),
            inactiveColor: Colors.grey,
          ),
          BarItem(
            icon: Icons.event,
            title: 'Diagnosis',
            activeColor: const Color(0xFFFB7E5E),
            inactiveColor: Colors.grey,
          ),
        ],
      ),
    );
  }
}
