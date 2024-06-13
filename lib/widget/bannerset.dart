import 'package:flutter/material.dart';

class SetBannerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      height: size.height * 0.25,
      decoration: BoxDecoration(
        color: const Color.fromRGBO(251, 126, 94, 1),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: Image.asset(
                'assets/images/cat.png',
                height: size.height * 0.2,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
