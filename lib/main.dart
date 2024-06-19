import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'apiservice.dart';
import 'home.dart';
import 'loginscreen.dart'; // Import the login screen

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<ApiService>(create: (_) => ApiService()),
      ],
      child: MaterialApp(
        title: 'Diagnosa Kucing',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        initialRoute: '/login',
        routes: {
          '/login': (context) => LoginScreen(),
          '/home': (context) => Home(),
        },
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
