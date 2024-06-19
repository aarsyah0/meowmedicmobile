import 'package:flutter/material.dart';

class UserDetailPage extends StatefulWidget {
  final void Function(
      String nik,
      String namaPemilik,
      String noHp,
      String alamat,
      String namaPeliharaan,
      String jekel,
      int? umur,
      double? berat,
      double? suhu) onSubmit;

  const UserDetailPage({Key? key, required this.onSubmit}) : super(key: key);

  @override
  _UserDetailPageState createState() => _UserDetailPageState();
}

class _UserDetailPageState extends State<UserDetailPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nikController = TextEditingController();
  final TextEditingController _namaPemilikController = TextEditingController();
  final TextEditingController _noHpController = TextEditingController();
  final TextEditingController _alamatController = TextEditingController();
  final TextEditingController _namaPeliharaanController =
      TextEditingController();
  final TextEditingController _jekelController = TextEditingController();
  final TextEditingController _umurController = TextEditingController();
  final TextEditingController _beratController = TextEditingController();
  final TextEditingController _suhuController = TextEditingController();

  @override
  void dispose() {
    _nikController.dispose();
    _namaPemilikController.dispose();
    _noHpController.dispose();
    _alamatController.dispose();
    _namaPeliharaanController.dispose();
    _jekelController.dispose();
    _umurController.dispose();
    _beratController.dispose();
    _suhuController.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      widget.onSubmit(
        _nikController.text,
        _namaPemilikController.text,
        _noHpController.text,
        _alamatController.text,
        _namaPeliharaanController.text,
        _jekelController.text,
        int.tryParse(_umurController.text),
        double.tryParse(_beratController.text),
        double.tryParse(_suhuController.text),
      );
    }
  }

  InputDecoration _buildInputDecoration(String labelText) {
    return InputDecoration(
      labelText: labelText,
      labelStyle: TextStyle(color: Colors.grey[700]),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.blue, width: 2.0),
        borderRadius: BorderRadius.circular(12.0),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey, width: 1.0),
        borderRadius: BorderRadius.circular(12.0),
      ),
      filled: true,
      fillColor: Colors.grey[200],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Details'),
        backgroundColor: Color(0xFFEFE3D3),
      ),
      body: Container(
        color: Color(0xFFEFE3D3), // Set the background color
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _nikController,
                decoration: _buildInputDecoration('NIK'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter NIK';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _namaPemilikController,
                decoration: _buildInputDecoration('Nama Pemilik'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter Nama Pemilik';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _noHpController,
                decoration: _buildInputDecoration('No HP'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter No HP';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _alamatController,
                decoration: _buildInputDecoration('Alamat'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter Alamat';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _namaPeliharaanController,
                decoration: _buildInputDecoration('Nama Peliharaan'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter Nama Peliharaan';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _jekelController,
                decoration: _buildInputDecoration('Jenis Kelamin'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter Jenis Kelamin';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _umurController,
                decoration: _buildInputDecoration('Umur'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter Umur';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _beratController,
                decoration: _buildInputDecoration('Berat'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter Berat';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _suhuController,
                decoration: _buildInputDecoration('Suhu'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter Suhu';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _submitForm,
                child: Text('Next'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.lightBlueAccent,
                  padding: EdgeInsets.symmetric(vertical: 20.0),
                  textStyle: TextStyle(fontSize: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
