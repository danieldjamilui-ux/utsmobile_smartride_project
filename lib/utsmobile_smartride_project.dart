import 'dart:io';
import 'dart:math';

// 🔹 Import semua model yang digunakan
import 'models/transportasi.dart';
import 'models/taksi.dart';
import 'models/bus.dart';
import 'models/pesawat.dart';
import 'models/pemesanan.dart';

/// 🔹 Fungsi untuk membuat ID unik untuk setiap pemesanan
/// Format: PREFIX-timestamp-randomNumber
String _generateId(String prefix) {
  final rnd = Random();
  final randomPart = rnd.nextInt(900) + 100; // angka acak antara 100–999
  final timestamp = DateTime.now().millisecondsSinceEpoch.toString(); // waktu unik
  return '$prefix-$timestamp-$randomPart'; // contoh: PMS-1700000000000-456
}

/// 🔹 Fungsi untuk membuat objek `Pemesanan`
/// - Memastikan jumlah penumpang > 0
/// - Menghitung total tarif berdasarkan jenis transportasi
Pemesanan buatPemesanan(Transportasi t, String nama, int jumlahPenumpang) {
  if (jumlahPenumpang <= 0) {
    throw ArgumentError('Jumlah penumpang harus > 0');
  }

  // Hitung total tarif menggunakan metode di dalam class transportasi
  double total = t.hitungTarif(jumlahPenumpang);

  // Buat ID pemesanan baru
  String idPesan = _generateId('PMS');

  // Kembalikan objek Pemesanan baru
  return Pemesanan(
    idPemesanan: idPesan,
    namaPelanggan: nama,
    transportasi: t,
    jumlahPenumpang: jumlahPenumpang,
    totalTarif: total,
  );
}

/// 🔹 Fungsi untuk menampilkan seluruh daftar pemesanan
/// Menampilkan struk satu per satu
void tampilSemuaPemesanan(List<Pemesanan> daftar) {
  print('\n===== RIWAYAT PEMESANAN (${daftar.length}) =====');
  for (var p in daftar) {
    p.cetakStruk(); // panggil method cetakStruk() di class Pemesanan
  }
  print('===== SELESAI =====\n');
}

/// 🔹 Fungsi utama aplikasi SmartRide
void mainSmartRide() {
  print('=== Aplikasi Pemesanan Transportasi SmartRide ===\n');

  // Menyimpan semua data pemesanan
  List<Pemesanan> daftarPemesanan = [];

  // 🔁 Perulangan menu utama
  while (true) {
    print('Pilih jenis transportasi:');
    print('1. Taksi');
    print('2. Bus');
    print('3. Pesawat');
    print('0. Keluar');
    stdout.write('Pilihan Anda: ');
    String? pilihan = stdin.readLineSync();

    // 🔸 Jika pengguna memilih "0", keluar dari aplikasi
    if (pilihan == '0') break;

    // Input nama pelanggan
    stdout.write('Nama pelanggan: ');
    String nama = stdin.readLineSync() ?? 'Anonim';

    // Input jumlah penumpang
    stdout.write('Jumlah penumpang: ');
    int jumlah = int.parse(stdin.readLineSync() ?? '1');

    Transportasi? t; // variabel untuk menyimpan objek transportasi yang dipilih

    // ==============================================================
    // 🔹 Jika pengguna memilih TAKSI
    // ==============================================================
    if (pilihan == '1') {
      stdout.write('Masukkan jarak perjalanan (km): ');
      double jarak = double.parse(stdin.readLineSync() ?? '1');

      t = Taksi(
        id: 'TX-${Random().nextInt(999)}',
        nama: 'Taksi SmartRide',
        tarifDasar: 3000.0,
        kapasitas: 4,
        jarak: jarak,
      );

    // ==============================================================
    // 🔹 Jika pengguna memilih BUS
    // ==============================================================
    } else if (pilihan == '2') {
      stdout.write('Apakah ada WiFi? (y/n): ');
      bool wifi = (stdin.readLineSync() ?? 'n').toLowerCase() == 'y';

      t = Bus(
        id: 'BS-${Random().nextInt(999)}',
        nama: 'Bus TransSmart',
        tarifDasar: 15000.0,
        kapasitas: 40,
        adaWifi: wifi,
      );

    // ==============================================================
    // 🔹 Jika pengguna memilih PESAWAT
    // ==============================================================
    } else if (pilihan == '3') {
      stdout.write('Masukkan kelas penerbangan (Ekonomi/Bisnis): ');
      String kelas = stdin.readLineSync() ?? 'Ekonomi';

      t = Pesawat(
        id: 'PS-${Random().nextInt(999)}',
        nama: 'Garuda Smart',
        tarifDasar: 500000.0,
        kapasitas: 180,
        kelas: kelas,
      );

    // ==============================================================
    // 🔹 Jika pilihan tidak valid
    // ==============================================================
    } else {
      print('Pilihan tidak valid!');
      continue; // kembali ke menu utama
    }

    // 🔹 Buat objek pemesanan berdasarkan input pengguna
    var pemesanan = buatPemesanan(t, nama, jumlah);

    // Tambahkan ke daftar semua pemesanan
    daftarPemesanan.add(pemesanan);

    // 🔹 Tampilkan struk pemesanan
    print('\n✅ Pemesanan berhasil dibuat!');
    pemesanan.cetakStruk();
  }

  // 🔹 Setelah keluar dari loop, tampilkan semua riwayat pemesanan
  tampilSemuaPemesanan(daftarPemesanan);

  print('Terima kasih telah menggunakan SmartRide!');
}
