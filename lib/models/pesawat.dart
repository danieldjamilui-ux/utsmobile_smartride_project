import 'transportasi.dart';

class Pesawat extends Transportasi {
  String kelas; // Ekonomi atau Bisnis

  Pesawat({
    required String id,
    required String nama,
    required double tarifDasar,
    required int kapasitas,
    required this.kelas,
  }) : super(id, nama, tarifDasar, kapasitas);

  @override
  double hitungTarif(int jumlahPenumpang) {
    double multiplier = (kelas.toLowerCase() == 'bisnis') ? 1.5 : 1.0;
    return tarifDasar * jumlahPenumpang * multiplier;
  }

  @override
  void tampilInfo() {
    super.tampilInfo();
    print('Tipe  : Pesawat');
    print('Kelas : $kelas');
  }
}
