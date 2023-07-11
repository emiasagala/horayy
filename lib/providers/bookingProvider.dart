import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:rental_mobile/models/bookingModel.dart';

class BookingProvider with ChangeNotifier {
  List<Booking> _bookingList = [];

  List<Booking> get BookingLIst => _bookingList;

  void addCar(Booking booking) {
    print(booking.tanggal);
    _bookingList.add(booking);
    notifyListeners();
  }

  void removeCar(Booking booking) {
    print(booking.nama);
    _bookingList.remove(booking);
    notifyListeners();
  }
}
