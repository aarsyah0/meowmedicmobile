import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'models/penyakit.dart';
import 'penyakitdetailscreen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Penyakit> _penyakits = [];

  @override
  void initState() {
    super.initState();
    _fetchPenyakits();
  }

  Future<void> _fetchPenyakits() async {
    final response =
        await http.get(Uri.parse('http://127.0.0.1:8000/api/penyakit'));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body)['data'];
      setState(() {
        _penyakits = data.map((item) => Penyakit.fromJson(item)).toList();
      });
    } else {
      throw Exception('Failed to load penyakits');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Search bar
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search | pets, toy, etc.',
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              // Slider
              CarouselSlider(
                options: CarouselOptions(
                  height: 200.0,
                  autoPlay: true,
                  enlargeCenterPage: true,
                ),
                items: [
                  _buildSliderItem(
                    'Keep your fur babies healthy',
                    'By giving proper care.',
                    'assets/images/meow.png',
                    Colors.teal.shade100,
                  ),
                  _buildSliderItem(
                    'VALENTINE\'S DAY FAVORITES',
                    '',
                    'assets/valentine_promo.png',
                    Colors.pink.shade50,
                  ),
                ].map((item) => item).toList(),
              ),
              SizedBox(height: 20),
              // Disease category
              Text(
                'Diseases',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 10),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: _penyakits
                      .map((penyakit) => _buildPenyakitCategory(penyakit))
                      .toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSliderItem(
      String title, String subtitle, String imagePath, Color backgroundColor) {
    return Container(
      margin: EdgeInsets.all(5.0),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Stack(
        children: [
          Positioned(
            left: 16,
            top: 16,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            right: 16,
            bottom: 16,
            child: Image.asset(
              imagePath,
              height: 120,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPenyakitCategory(Penyakit penyakit) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PenyakitDetailScreen(penyakit: penyakit),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage('assets/images/' + penyakit.gambar),
            ),
            SizedBox(height: 8),
            Text(penyakit.nama),
          ],
        ),
      ),
    );
  }
}
