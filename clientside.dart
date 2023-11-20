import 'dart:io';

void main() {
  List<Tamu> daftarTamu = [];

  while (true) {
    stdout.write("Masukkan ID Tamu: ");
    String idTamu = stdin.readLineSync()!;
    stdout.write("Masukkan Nama Tamu: ");
    String namaTamu = stdin.readLineSync()!;
    stdout.write("Masukkan Nama Tamu Tambahan: ");
    String namaTamuTambahan = stdin.readLineSync()!;
    stdout.write("Masukkan Alamat Tamu: ");
    String alamatTamu = stdin.readLineSync()!;
    stdout.write("Masukkan Tanggal Check-in (DD-MM-YYYY): ");
    String tanggalCheckin = stdin.readLineSync()!;
    stdout.write("Masukkan Tanggal Check-out (DD-MM-YYYY): ");
    String tanggalCheckout = stdin.readLineSync()!;

    stdout.write("Pilih jenis kamar (Standart/Superior/Deluxe): ");
    String jenisKamar = stdin.readLineSync()!.toLowerCase();

    Tamu tamu;
    if (jenisKamar == "standart") {
      tamu = TamuBiasa(
        id: idTamu,
        nama: namaTamu,
        namatambahan: namaTamuTambahan,
        alamat: alamatTamu,
        checkin: tanggalCheckin,
        checkout: tanggalCheckout,
      );
    } else {
      tamu = TamuIstimewa(
        id: idTamu,
        nama: namaTamu,
        namatambahan: namaTamuTambahan,
        alamat: alamatTamu,
        checkin: tanggalCheckin,
        checkout: tanggalCheckout,
        jenisKamar: jenisKamar,
      );
    }

    daftarTamu.add(tamu);

    stdout.write("Ingin menambah data tamu lainnya? (ya/tidak): ");
    String tambahLainnya = stdin.readLineSync()!.toLowerCase();
    if (tambahLainnya != "ya") {
      break;
    }
  }

  File file = File('data_tamu.txt');
  IOSink sink = file.openWrite(mode: FileMode.write);
  for (Tamu tamu in daftarTamu) {
    sink.write("${tamu.id}, ${tamu.nama}, ${tamu.namatambahan}, ${tamu.alamat}, ${tamu.checkin}, ${tamu.checkout}");
    if (tamu is TamuIstimewa) {
      sink.write(", ${tamu.jenisKamar}");
    }
    sink.write("\n");
  }
  sink.close();

  print("Data tamu telah disimpan ke dalam file server (data_tamu.txt)");
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

class TamuBiasa extends Tamu {
  TamuBiasa({
    required String id,
    required String nama,
    required String namatambahan,
    required String alamat,
    required String checkin,
    required String checkout,
  }) : super(
          id: id,
          nama: nama,
          namatambahan: namatambahan,
          alamat: alamat,
          checkin: checkin,
          checkout: checkout,
        );
}

class TamuIstimewa extends Tamu {
  final String jenisKamar;

  TamuIstimewa({
    required String id,
    required String nama,
    required String namatambahan,
    required String alamat,
    required String checkin,
    required String checkout,
    required this.jenisKamar,
  }) : super(
          id: id,
          nama: nama,
          namatambahan: namatambahan,
          alamat: alamat,
          checkin: checkin,
          checkout: checkout,
        );
}
