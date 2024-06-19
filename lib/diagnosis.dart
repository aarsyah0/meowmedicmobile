import 'package:flutter/material.dart';

import 'apiservice.dart';
import 'diagnosis_result_page.dart';
import 'models/diagnosis_result.dart';

class DiagnosaPage extends StatefulWidget {
  final String nik;
  final String namaPemilik;
  final String noHp;
  final String alamat;
  final String namaPeliharaan;
  final String jekel;
  final int? umur;
  final double? berat;
  final double? suhu;

  const DiagnosaPage({
    Key? key,
    required this.nik,
    required this.namaPemilik,
    required this.noHp,
    required this.alamat,
    required this.namaPeliharaan,
    required this.jekel,
    this.umur,
    this.berat,
    this.suhu,
  }) : super(key: key);

  @override
  _DiagnosaPageState createState() => _DiagnosaPageState();
}

class _DiagnosaPageState extends State<DiagnosaPage> {
  final ApiService apiService = ApiService();
  List<dynamic> gejalas = [];
  Map<String, String> selectedGejalas = {};
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    fetchGejalas();
  }

  Future<void> fetchGejalas() async {
    try {
      final gejalasList = await apiService.getGejalas();
      if (mounted) {
        // Check if the widget is still mounted before setting state
        setState(() {
          gejalas = gejalasList;
        });
      }
    } catch (e) {
      print('Failed to load gejalas: $e');
    }
  }

  void submitDiagnosa() async {
    if (selectedGejalas.isEmpty) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Peringatan'),
            content:
                Text('Pilih setidaknya satu gejala untuk meneruskan diagnosa.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
      return;
    }

    final List<Map<String, String>> gejalaFormatted = gejalas
        .where((gejala) => selectedGejalas.containsKey(gejala['id'].toString()))
        .map((gejala) {
      final String id = gejala['id'].toString();
      final String kondisi = selectedGejalas[id]!;
      return {
        'id': id,
        'kondisi': kondisi,
        'nama': gejala['nama'].toString(),
      };
    }).toList();

    final List<String> kondisiList =
        gejalaFormatted.map((gejala) => gejala['kondisi']!).toList();

    try {
      final diagnosisResult = await apiService.analisa(
        kondisi: kondisiList,
        nik: widget.nik,
        namaPemilik: widget.namaPemilik,
        noHp: widget.noHp,
        alamat: widget.alamat,
        namaPeliharaan: widget.namaPeliharaan,
        jekel: widget.jekel,
        umur: widget.umur,
        berat: widget.berat,
        suhu: widget.suhu,
      );
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DiagnosisResultPage(
            result: DiagnosisResult.fromJson(diagnosisResult),
          ),
        ),
      );
    } catch (e) {
      print('Failed to analyze diagnosis: $e');
    }
  }

  void nextQuestion() {
    setState(() {
      if (currentIndex < gejalas.length - 1) {
        currentIndex++;
      }
    });
  }

  void previousQuestion() {
    setState(() {
      if (currentIndex > 0) {
        currentIndex--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Diagnosis'),
      ),
      body: gejalas.isEmpty
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'Please choose the symptoms that match your pet conditions',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Divider(
                      height: 30,
                      thickness: 1,
                      color: Colors.grey,
                    ),
                    Text(
                      '${currentIndex + 1}. ${gejalas[currentIndex]['nama']}',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: Colors.blue,
                        ),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          value: selectedGejalas[
                              gejalas[currentIndex]['id'].toString()],
                          items: [
                            DropdownMenuItem(
                              value: '${gejalas[currentIndex]['id']}_1',
                              child: Text('Pasti'),
                            ),
                            DropdownMenuItem(
                              value: '${gejalas[currentIndex]['id']}_2',
                              child: Text('Hampir Pasti'),
                            ),
                            DropdownMenuItem(
                              value: '${gejalas[currentIndex]['id']}_3',
                              child: Text('Mungkin'),
                            ),
                            DropdownMenuItem(
                              value: '${gejalas[currentIndex]['id']}_4',
                              child: Text('Ragu-ragu'),
                            ),
                            DropdownMenuItem(
                              value: '${gejalas[currentIndex]['id']}_0',
                              child: Text('Tidak'),
                            ),
                          ],
                          onChanged: (value) {
                            setState(() {
                              selectedGejalas[gejalas[currentIndex]['id']
                                  .toString()] = value!;
                            });
                          },
                          hint: Text('Pilih Kondisi'),
                          icon: Icon(Icons.arrow_drop_down, color: Colors.blue),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        if (currentIndex > 0)
                          ElevatedButton(
                            onPressed: previousQuestion,
                            child: Text('← Previous Question'),
                            style: ElevatedButton.styleFrom(
                              primary: Colors.grey[300],
                              onPrimary: Colors.black,
                            ),
                          ),
                        ElevatedButton(
                          onPressed: currentIndex < gejalas.length - 1
                              ? nextQuestion
                              : submitDiagnosa,
                          child: Text(
                            currentIndex < gejalas.length - 1
                                ? 'Next Question →'
                                : 'Submit',
                          ),
                          style: ElevatedButton.styleFrom(
                            primary: Colors.blue,
                            onPrimary: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
