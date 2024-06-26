class Penyakit {
  final String id;
  final String nama;
  final String slug;
  final String deskripsi;
  final String solusi;
  final String gambar;
  final String createdAt;
  final String updatedAt;

  Penyakit({
    required this.id,
    required this.nama,
    required this.slug,
    required this.deskripsi,
    required this.solusi,
    required this.gambar,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Penyakit.fromJson(Map<String, dynamic> json) {
    return Penyakit(
      id: json['id'],
      nama: json['nama'],
      slug: json['slug'],
      deskripsi: json['deskripsi'],
      solusi: json['solusi'],
      gambar: json['gambar'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }
}
