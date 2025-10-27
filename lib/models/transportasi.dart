 abstract class Transportasi {
  final String id;
  final String nama;
  final int kapasitas;
  final double _tarifDasar; // private (enkapsulasi)

  Transportasi(this.id, this.nama, this._tarifDasar, this.kapasitas);

  double get tarifDasar => _tarifDasar;

  double hitungTarif(int jumlahPenumpang);

  void tampilInfo() {
    print('--- Info Transportasi ---');
    print('ID         : $id');
    print('Nama       : $nama');
    print('Kapasitas  : $kapasitas orang');
    print('Tarif Dasar: Rp ${_tarifDasar.toStringAsFixed(2)}');
  }
}
