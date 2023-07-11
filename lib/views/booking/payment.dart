import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rental_mobile/models/paymentModel.dart';
import 'package:rental_mobile/providers/CarProvider.dart';
import 'package:rental_mobile/views/booking/voucher.dart';
import 'package:uuid/uuid.dart';

class PayementScreen extends StatefulWidget {
  const PayementScreen({super.key});

  @override
  State<PayementScreen> createState() => _PayementScreenState();
}

class _PayementScreenState extends State<PayementScreen> {
  String? _payment;
  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<CarProvider>(context);
    final uuid = Uuid();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rental Mobil Horayyy'),
        centerTitle: true,
      ),
      body: Container(
        margin: const EdgeInsets.only(left: 20),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 20, bottom: 70),
              child: const Column(
                children: [
                  Text(
                    "Choose Your",
                    style: TextStyle(color: Colors.red, fontSize: 25),
                  ),
                  Text(
                    "Payment Method !",
                    style: TextStyle(color: Colors.red, fontSize: 25),
                  ),
                ],
              ),
            ),
            Column(
              children: <Widget>[
                RadioListTile(
                  title: const Text('BCA TRANSFER'),
                  value: 'BCA',
                  groupValue: _payment,
                  onChanged: (value) {
                    setState(() {
                      _payment = value;
                    });
                  },
                ),
                RadioListTile(
                  title: const Text('OVO'),
                  value: 'OVO',
                  groupValue: _payment,
                  onChanged: (value) {
                    setState(() {
                      _payment = value;
                    });
                  },
                ),
                RadioListTile(
                  title: const Text('GOPAY'),
                  value: 'GOPAY',
                  groupValue: _payment,
                  onChanged: (value) {
                    setState(() {
                      _payment = value;
                    });
                  },
                ),
                RadioListTile(
                  title: const Text('CASH ON DELIVERY'),
                  value: 'COD',
                  groupValue: _payment,
                  onChanged: (value) {
                    setState(() {
                      _payment = value;
                    });
                  },
                ),
                RadioListTile(
                  title: const Text('OTHER BANK TF'),
                  value: 'OBT',
                  groupValue: _payment,
                  onChanged: (value) {
                    setState(() {
                      _payment = value;
                    });
                  },
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.only(top: 60, right: 15),
              child: SizedBox(
                height: 40,
                width: 100,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                  onPressed: () {
                    prov.addPayment(
                      Payment(
                        id: uuid.v1(),
                        jenis: _payment.toString(),
                      ),
                    );
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const VoucherScreen(),
                      ),
                    );
                  },
                  child: const Text('Next'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
