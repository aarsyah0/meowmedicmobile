import 'package:flutter/material.dart';
import 'settingscreen.dart';
import 'package:sliding_clipped_nav_bar/sliding_clipped_nav_bar.dart';
import 'homescreen.dart'; // Pastikan Anda mengimpor file yang sesuai
import 'diagnosisscreen.dart'; // Pastikan Anda mengimpor file yang sesuai

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'MeowMedic',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: PageView(
              physics: NeverScrollableScrollPhysics(),
              controller: controller,
              children: [
                Center(
                  child: HomeScreen(), // Memastikan Home adalah widget valid
                ),
                Center(
                  child:
                      DiagnosisScreen(), // Memastikan DiagnosisScreen adalah widget valid
                ),
                Center(
                  child: SettingScreen(), // Halaman tambahan
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: SlidingClippedNavBar.colorful(
        backgroundColor: Colors.white,
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
            activeColor: Colors.black,
            inactiveColor: const Color.fromRGBO(116, 206, 205, 1),
          ),
          BarItem(
            icon: Icons.event,
            title: 'Diagnosis',
            activeColor: Colors.black,
            inactiveColor: const Color.fromRGBO(116, 206, 205, 1),
          ),
          BarItem(
            icon: Icons.settings,
            title: 'Setting',
            activeColor: Colors.black,
            inactiveColor: const Color.fromRGBO(116, 206, 205, 1),
          ),
        ],
      ),
    );
  }
}
