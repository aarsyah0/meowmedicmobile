import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl = 'http://127.0.0.1:8000/api/diagnosa';

  Future<List<dynamic>> getGejalas() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      return json.decode(response.body)['gejalas'];
    } else {
      throw Exception('Failed to load gejalas');
    }
  }

  Future<Map<String, dynamic>> analisa({
    required List<String> kondisi,
    required String nik,
    required String namaPemilik,
    required String noHp,
    required String alamat,
    required String namaPeliharaan,
    required String jekel,
    required int? umur,
    required double? berat,
    required double? suhu,
  }) async {
    final response = await http.post(
      Uri.parse('$baseUrl/analisa'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({
        'kondisi': kondisi,
        'nik': nik,
        'nama_pemilik': namaPemilik,
        'no_hp': noHp,
        'alamat': alamat,
        'nama_peliharaan': namaPeliharaan,
        'jekel': jekel,
        'umur': umur,
        'berat': berat,
        'suhu': suhu,
      }),
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to analyze diagnosis');
    }
  }

  Future<void> reset() async {
    final response = await http.post(Uri.parse('$baseUrl/reset'));

    if (response.statusCode != 200) {
      throw Exception('Failed to reset session');
    }
  }
}
