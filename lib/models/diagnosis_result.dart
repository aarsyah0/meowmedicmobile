class DiagnosisResult {
  final Map<String, dynamic> diagnosa;
  final Map<String, dynamic> cfHasil;
  final List<dynamic> penyakits;
  final Map<String, String> kepastian;

  DiagnosisResult({
    required this.diagnosa,
    required this.cfHasil,
    required this.penyakits,
    required this.kepastian,
  });

  factory DiagnosisResult.fromJson(Map<String, dynamic> json) {
    return DiagnosisResult(
      diagnosa: json['diagnosa'],
      cfHasil: Map<String, dynamic>.from(json['cfHasil']),
      penyakits: List<dynamic>.from(json['penyakits']),
      kepastian: Map<String, String>.from(json['kepastian']),
    );
  }
}
