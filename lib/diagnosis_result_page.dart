import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'home.dart';
import 'models/diagnosis_result.dart';

class DiagnosisResultPage extends StatelessWidget {
  final DiagnosisResult result;

  DiagnosisResultPage({required this.result});

  Map<String, dynamic> findGejalaById(String gejalaId) {
    for (var penyakit in result.penyakits) {
      for (var gejala in penyakit['basis_pengetahuans']) {
        if (gejala['gejala_id'] == gejalaId) {
          return gejala;
        }
      }
    }
    return {'gejala_id': 'Unknown'};
  }

  Map<String, dynamic> getPenyakitTerdiagnosa() {
    final highestCfPenyakitId = result.cfHasil.keys.firstWhere(
      (key) =>
          result.cfHasil[key] ==
          result.cfHasil.values.reduce((a, b) => a > b ? a : b),
      orElse: () => 'Unknown',
    );

    return result.penyakits.firstWhere(
      (penyakit) => penyakit['id'] == highestCfPenyakitId,
      orElse: () => {
        'nama': 'Unknown',
        'deskripsi': 'Unknown',
        'solusi': 'Unknown',
        'gambar': 'default.png', // Default image filename
      },
    );
  }

  void resetAndNavigate(BuildContext context, Widget page) {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => page),
      (Route<dynamic> route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    final penyakitTerdiagnosa = getPenyakitTerdiagnosa();
    const double cardTableWidth = 500.0;

    return Scaffold(
      appBar: AppBar(
        title: Text('Hasil Diagnosa'),
        backgroundColor: Color(0xFFFB7E5E),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Users Input',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFFB7E5E),
                ),
              ),
              SizedBox(height: 10),
              ConstrainedBox(
                constraints: BoxConstraints(maxWidth: cardTableWidth),
                child: DataTable(
                  columnSpacing: 20.0,
                  headingRowColor: MaterialStateColor.resolveWith(
                      (states) => Color(0xFFEFE3D3)),
                  columns: [
                    DataColumn(
                        label: Text('No',
                            style: TextStyle(color: Color(0xFFFB7E5E)))),
                    DataColumn(
                        label: Text('Symptoms',
                            style: TextStyle(color: Color(0xFFFB7E5E)))),
                    DataColumn(
                        label: Text('Condition',
                            style: TextStyle(color: Color(0xFFFB7E5E)))),
                  ],
                  rows: List.generate(result.kepastian.length, (index) {
                    final gejalaId = result.kepastian.keys.elementAt(index);
                    final gejala = findGejalaById(gejalaId);
                    final kondisi = result.kepastian[gejalaId];
                    String kondisiText;
                    switch (kondisi) {
                      case '1':
                        kondisiText = 'Certain';
                        break;
                      case '2':
                        kondisiText = 'Almost certain';
                        break;
                      case '3':
                        kondisiText = 'Maybe';
                        break;
                      case '4':
                        kondisiText = 'Doubtful';
                        break;
                      default:
                        kondisiText = 'No';
                        break;
                    }
                    return DataRow(cells: [
                      DataCell(Text('${index + 1}')),
                      DataCell(Text(gejala['gejala_id'])),
                      DataCell(Text(kondisiText)),
                    ]);
                  }),
                ),
              ),
              Divider(),
              Text(
                'Diagnosed Disease:',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFFB7E5E),
                ),
              ),
              SizedBox(height: 20),
              ConstrainedBox(
                constraints: BoxConstraints(maxWidth: cardTableWidth),
                child: Card(
                  color: Color(0xFFEFE3D3),
                  margin: EdgeInsets.symmetric(vertical: 10.0),
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Diagnosed Disease:',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFFFB7E5E),
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          penyakitTerdiagnosa['nama'] ?? 'Unknown',
                          style: TextStyle(fontSize: 18, color: Colors.black87),
                        ),
                        SizedBox(height: 10),
                        penyakitTerdiagnosa['gambar'] != null
                            ? Center(
                                child: Image.asset(
                                  'assets/images/' +
                                      penyakitTerdiagnosa['gambar'],
                                  width: 400,
                                  height: 300,
                                  fit: BoxFit.cover,
                                ),
                              )
                            : SizedBox.shrink(),
                      ],
                    ),
                  ),
                ),
              ),
              ConstrainedBox(
                constraints: BoxConstraints(maxWidth: cardTableWidth),
                child: Card(
                  color: Color(0xFFEFE3D3),
                  margin: EdgeInsets.symmetric(vertical: 10.0),
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Percentage:',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFFFB7E5E),
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          '${result.cfHasil[penyakitTerdiagnosa['id']] != null ? result.cfHasil[penyakitTerdiagnosa['id']]! * 100 : 0}%',
                          style: TextStyle(fontSize: 18, color: Colors.black87),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              ConstrainedBox(
                constraints: BoxConstraints(maxWidth: cardTableWidth),
                child: Card(
                  color: Color(0xFFEFE3D3),
                  margin: EdgeInsets.symmetric(vertical: 10.0),
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Description:',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFFFB7E5E),
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          penyakitTerdiagnosa['deskripsi'] ?? 'Unknown',
                          style: TextStyle(fontSize: 16, color: Colors.black87),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              ConstrainedBox(
                constraints: BoxConstraints(maxWidth: cardTableWidth),
                child: Card(
                  color: Color(0xFFEFE3D3),
                  margin: EdgeInsets.symmetric(vertical: 10.0),
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Solution:',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFFFB7E5E),
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          penyakitTerdiagnosa['solusi'] ?? 'Unknown',
                          style: TextStyle(fontSize: 16, color: Colors.black87),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Text(
                'Other Possible Diseases:',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFFB7E5E),
                ),
              ),
              SizedBox(height: 10),
              ConstrainedBox(
                constraints: BoxConstraints(maxWidth: cardTableWidth),
                child: DataTable(
                  columnSpacing: 20.0,
                  headingRowColor: MaterialStateColor.resolveWith(
                      (states) => Color(0xFFEFE3D3)),
                  columns: [
                    DataColumn(
                        label: Text('No',
                            style: TextStyle(color: Color(0xFFFB7E5E)))),
                    DataColumn(
                        label: Text('Other Possible Diseases',
                            style: TextStyle(color: Color(0xFFFB7E5E)))),
                    DataColumn(
                        label: Text('Percentage',
                            style: TextStyle(color: Color(0xFFFB7E5E)))),
                  ],
                  rows: List.generate(result.cfHasil.length, (index) {
                    final penyakitId = result.cfHasil.keys.elementAt(index);
                    final penyakit = result.penyakits.firstWhere(
                      (penyakit) => penyakit['id'] == penyakitId,
                      orElse: () => {'nama': 'Unknown', 'presentase': 0},
                    );
                    return DataRow(cells: [
                      DataCell(Text('${index + 1}')),
                      DataCell(Text(penyakit['nama'])),
                      DataCell(Text(
                          '${result.cfHasil[penyakitId] != null ? result.cfHasil[penyakitId]! * 100 : 0}%')),
                    ]);
                  }),
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Reset data and navigate to the diagnosis page
                      resetAndNavigate(context,
                          Home()); // Replace MainPage with your diagnosis page widget
                    },
                    child: Text('Diagnose Again'),
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xFFFB7E5E),
                      onPrimary: Colors.white,
                    ),
                  ),
                  SizedBox(width: 20),
                ],
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

// Function to fetch diagnosis result
Future<DiagnosisResult> fetchDiagnosisResult() async {
  final response = await http.get(Uri.parse('URL_TO_YOUR_API'));

  if (response.statusCode == 200) {
    return DiagnosisResult.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load diagnosis result');
  }
}
