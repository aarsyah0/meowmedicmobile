import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
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
                    'assets/cat_doctor.png',
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
              // Pets category
              Text(
                'Pets',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildPetCategory(Icons.pets, 'Bird'),
                  _buildPetCategory(Icons.pets, 'Cat'),
                  _buildPetCategory(Icons.pets, 'Dog'),
                  _buildPetCategory(Icons.pets, 'Fish'),
                  _buildPetCategory(Icons.pets, 'Rabbit'),
                  _buildPetCategory(Icons.pets, 'Reptile'),
                ],
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

  Widget _buildPetCategory(IconData iconData, String label) {
    return Column(
      children: [
        CircleAvatar(
          radius: 30,
          child: Icon(
            iconData,
            size: 30,
          ),
        ),
        SizedBox(height: 8),
        Text(label),
      ],
    );
  }
}
