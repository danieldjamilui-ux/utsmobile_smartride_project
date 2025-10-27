import 'transportasi.dart';

class Bus extends Transportasi {
  bool adaWifi;

  Bus({
    required String id,
    required String nama,
    required double tarifDasar,
    required int kapasitas,
    required this.adaWifi,
  }) : super(id, nama, tarifDasar, kapasitas);

  @override
  double hitungTarif(int jumlahPenumpang) {
    double total = tarifDasar * jumlahPenumpang;
    if (adaWifi) total += 5000;
    return total;
  }

  @override
  void tampilInfo() {
    super.tampilInfo();
    print('Tipe : Bus');
    print('WiFi : ${adaWifi ? "Ada" : "Tidak"}');
  }
}
