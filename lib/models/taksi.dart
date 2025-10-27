import 'transportasi.dart';

class Taksi extends Transportasi {
  double jarak; // km

  Taksi({
    required String id,
    required String nama,
    required double tarifDasar,
    required int kapasitas,
    required this.jarak,
  }) : super(id, nama, tarifDasar, kapasitas);

  @override
  double hitungTarif(int jumlahPenumpang) {
    return tarifDasar * jarak;
  }

  @override
  void tampilInfo() {
    super.tampilInfo();
    print('Tipe  : Taksi');
    print('Jarak : ${jarak.toStringAsFixed(2)} km');
  }
}
