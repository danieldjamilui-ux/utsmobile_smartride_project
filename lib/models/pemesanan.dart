import 'transportasi.dart';

class Pemesanan {
  final String idPemesanan;
  final String namaPelanggan;
  final Transportasi transportasi;
  final int jumlahPenumpang;
  final double totalTarif;

  Pemesanan({
    required this.idPemesanan,
    required this.namaPelanggan,
    required this.transportasi,
    required this.jumlahPenumpang,
    required this.totalTarif,
  });

  void cetakStruk() {
    print('\n========== STRUK PEMESANAN ==========');
    print('ID Pemesanan   : $idPemesanan');
    print('Nama Pelanggan : $namaPelanggan');
    print('Jumlah Penumpang : $jumlahPenumpang');
    print('Total Tarif    : Rp ${totalTarif.toStringAsFixed(2)}');
    print('--- Detail Transportasi ---');
    transportasi.tampilInfo();
    print('=====================================\n');
  }
}
