import 'dart:io';

void main() {
  // Membuat daftar tamu
  List<Tamu> daftarTamu = [];

  while (true) {
    stdout.write("Masukkan ID Tamu: ");
    String idTamu = stdin.readLineSync()!;
    stdout.write("Masukkan Nama Tamu: ");
    String namaTamu = stdin.readLineSync()!;
    stdout.write("Masukkan nama tamu tambahan: ");
    String namaTamuTambahan = stdin.readLineSync()!;
    stdout.write("Masukkan Alamat Tamu: ");
    String alamatTamu = stdin.readLineSync()!;
    stdout.write("Masukkan Tanggal Check-in (DD-MM-YYYY): ");
    String tanggalCheckin = stdin.readLineSync()!;
    stdout.write("Masukkan Tanggal Check-out (DD-MM-YYYY): ");
    String tanggalCheckout = stdin.readLineSync()!;

    // Membuat objek Tamu
    Tamu tamu = Tamu(
      id: idTamu,
      nama: namaTamu,
      namatambahan: namaTamuTambahan,
      alamat: alamatTamu,
      checkin: tanggalCheckin,
      checkout: tanggalCheckout,
    );

    // Menambahkan tamu ke daftar
    daftarTamu.add(tamu);

    stdout.write("Ingin menambah data tamu lainnya? (ya/tidak): ");
    String tambahLainnya = stdin.readLineSync()!.toLowerCase();
    if (tambahLainnya != "ya") {
      break;
    }
  }

  // Menyimpan data tamu ke dalam file
  File file = File('data_tamu.txt');
  IOSink sink = file.openWrite(mode: FileMode.write);
  for (Tamu tamu in daftarTamu) {
    sink.write("${tamu.id}, ${tamu.nama}, ${tamu.namatambahan}, ${tamu.alamat}, ${tamu.checkin}, ${tamu.checkout}\n");
  }
  sink.close();

  // Kode berakhir
  print("Data tamu telah disimpan ke dalam file server");
  // Data tersimpan pada data_tamu.txt
  print("Terima kasih!");
}

class Tamu {
  final String id;
  final String nama;
  final String namatambahan;
  final String alamat;
  final String checkin;
  final String checkout;

  Tamu({
    required this.id,
    required this.nama,
    required this.namatambahan,
    required this.alamat,
    required this.checkin,
    required this.checkout,
  });
}
