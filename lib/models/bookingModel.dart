import 'package:rental_mobile/Models/CarModel.dart';

class Booking {
  final String id;
  final Item item;
  final String nama;
  final String fotodiri;
  final String fotoktp;
  final String tanggal;

  Booking({
    required String this.id,
    required this.item,
    required String this.nama,
    required String this.fotodiri,
    required String this.fotoktp,
    required String this.tanggal,
  });
}
