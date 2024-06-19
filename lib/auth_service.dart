import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AuthService {
  static const String baseUrl = 'http://127.0.0.1:8000/api';

  Future<bool> login(String username, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/login'),
      body: {
        'username': username,
        'password': password,
      },
    );

    if (response.statusCode == 200) {
      // Login berhasil, lakukan sesuatu di sini
      return true;
    } else {
      // Login gagal, tampilkan pesan kesalahan
      final responseData = json.decode(response.body);
      final errorMessage = responseData['message'];
      debugPrint(errorMessage);
      return false;
    }
  }

  Future<bool> signup(
      String name, String username, String email, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/signup'),
      body: {
        'name': name,
        'username': username,
        'email': email,
        'password': password,
      },
    );

    if (response.statusCode == 201) {
      // Pendaftaran berhasil
      return true;
    } else {
      // Pendaftaran gagal, tampilkan pesan kesalahan
      final responseData = json.decode(response.body);
      final errorMessage = responseData['message'];
      debugPrint(errorMessage);
      return false;
    }
  }
}
