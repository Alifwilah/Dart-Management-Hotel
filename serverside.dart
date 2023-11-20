import 'dart:io';
import 'dart:math';

void main() {
  List<Tamu> daftarTamu = [];

  File file = File('data_tamu.txt');
  if (file.existsSync()) {
    List<String> lines = file.readAsLinesSync();
    for (String line in lines) {
      List<String> parts = line.split(', '); 
      if (parts.length == 7) { // Menambahkan field untuk nomor kamar
        String id = parts[0];
        String nama = parts[1];
        String namatambahan = parts[2];
        String alamat = parts[3];
        String checkin = parts[4];
        String checkout = parts[5];
        String nomorKamar = parts[6]; // Menambahkan nomor kamar dari file
        Tamu tamu;
        if (nomorKamar.contains('Room')) {
          tamu = TamuBiasa(
            id: id,
            nama: nama,
            namatambahan: namatambahan,
            alamat: alamat,
            checkin: checkin,
            checkout: checkout,
            nomorKamar: nomorKamar,
          );
        } else {
          tamu = TamuIstimewa(
            id: id,
            nama: nama,
            namatambahan: namatambahan,
            alamat: alamat,
            checkin: checkin,
            checkout: checkout,
            nomorKamar: nomorKamar,
          );
        }
        daftarTamu.add(tamu);
      }
    }
  } else {
    print("File data_tamu.txt tidak ditemukan.");
    return;
  }

  print("Data Tamu Hotel:");
  for (Tamu tamu in daftarTamu) {
    print("ID Tamu: ${tamu.id}");
    print("Nama Tamu: ${tamu.nama}");
    print("Nama Tamu Tambahan: ${tamu.namatambahan}");
    print("Alamat Tamu: ${tamu.alamat}");
    print("Check-in: ${tamu.checkin}");
    print("Check-out: ${tamu.checkout}");
    print("Nomor Kamar: ${tamu.nomorKamar}");

    if (tamu is TamuIstimewa) {
      int hargaMin = 800000; // 800rb
      int hargaMax = 1000000; // 1jt
      int hargaRandom = hargaMin + Random().nextInt(hargaMax - hargaMin + 1);
      print("Harga: Rp $hargaRandom");

      print("Kupon Spa Gratis");
    } else {
      int hargaMin = 200000; // 200rb
      int hargaMax = 300000; // 300rb
      int hargaRandom = hargaMin + Random().nextInt(hargaMax - hargaMin + 1);
      print("Harga: Rp $hargaRandom");
    }

    print("");
  }
}

class Tamu {
  final String id;
  final String nama;
  final String namatambahan;
  final String alamat;
  final String checkin;
  final String checkout;
  late String nomorKamar;

  Tamu({
    required this.id,
    required this.nama,
    required this.namatambahan,
    required this.alamat,
    required this.checkin,
    required this.checkout,
    required this.nomorKamar,
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
    required String nomorKamar,
  }) : super(
          id: id,
          nama: nama,
          namatambahan: namatambahan,
          alamat: alamat,
          checkin: checkin,
          checkout: checkout,
          nomorKamar: nomorKamar,
        );
}

class TamuIstimewa extends Tamu {
  TamuIstimewa({
    required String id,
    required String nama,
    required String namatambahan,
    required String alamat,
    required String checkin,
    required String checkout,
    required String nomorKamar,
  }) : super(
          id: id,
          nama: nama,
          namatambahan: namatambahan,
          alamat: alamat,
          checkin: checkin,
          checkout: checkout,
          nomorKamar: nomorKamar,
        );
}
