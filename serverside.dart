import 'dart:io';
import 'dart:math';

void main() {
  List<Tamu> daftarTamu = [];

  // Buka file yang berisi data tamu
  File file = File('data_tamu.txt');
  if (file.existsSync()) {
    List<String> lines = file.readAsLinesSync();
    for (String line in lines) {
      List<String> parts = line.split(', '); // Misalnya, pemisah data adalah ', '.
      if (parts.length == 6) {
        String id = parts[0];
        String nama = parts[1];
        String namatambahan = parts[2];
        String alamat = parts[3];
        String checkin = parts[4];
        String checkout = parts[5];
        Tamu tamu = Tamu(
          id: id,
          nama: nama,
          namatambahan: namatambahan,
          alamat: alamat,
          checkin: checkin,
          checkout: checkout,
        );
        daftarTamu.add(tamu);
      }
    }
  } else {
    print("File data_tamu.txt tidak ditemukan.");
    return;
  }

  // Menampilkan data tamu
  print("Data Tamu Hotel:");
  for (Tamu tamu in daftarTamu) {
    print("ID Tamu: ${tamu.id}");
    print("Nama Tamu: ${tamu.nama}");
    print("Nama Tamu Tambahan: ${tamu.namatambahan}");
    print("Alamat Tamu: ${tamu.alamat}");
    print("Check-in: ${tamu.checkin}");
    print("Check-out: ${tamu.checkout}");
    print("Nomor Kamar: ${tamu.nomorKamar}");
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
  }) {
    // Fungsi akan menggenerate nomor kamar
    nomorKamar = generateRandomRoomNumber();
  }

  String generateRandomRoomNumber() {
    Random random = Random();
    int roomNumber = random.nextInt(100) + 1; // Memunculkan angka antara 1 sampai 100
    return "Room $roomNumber";
  }
}
