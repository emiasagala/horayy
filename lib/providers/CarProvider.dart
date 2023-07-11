import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:rental_mobile/models/paymentModel.dart';

class CarProvider with ChangeNotifier {
  List<Payment> _OrderList = [];

  List<Payment> get OrderList => _OrderList;

  void addPayment(Payment payment) {
    print(payment.jenis);
    _OrderList.add(payment);
    notifyListeners();
  }

  void removePayment(Payment payment) {
    print(payment);
    _OrderList.remove(payment);
    notifyListeners();
  }
}
