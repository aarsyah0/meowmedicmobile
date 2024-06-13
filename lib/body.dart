import 'package:flutter/material.dart';
import 'constant.dart';
import 'package:sliding_clipped_nav_bar/sliding_clipped_nav_bar.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
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
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Column(
        children: [
          Container(
            height: size.height * 0.155,
            decoration: BoxDecoration(
              color: PrimaryColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 16.0,
                    horizontal: 16.0,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Keep your fur babies healthy',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 25),
                  child: Image.asset('assets/images/kucing.png'),
                ),
              ],
            ),
          ),
          Expanded(
            child: PageView(
              physics: NeverScrollableScrollPhysics(),
              controller: controller,
              children: [
                // Your page content widgets go here
                // Example:
                Center(
                  child: Text('Page 1'),
                ),
                Center(
                  child: Text('Page 2'),
                ),
                Center(
                  child: Text('Page '),
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
          // Add more BarItem if you want
        ],
      ),
    );
  }
}
