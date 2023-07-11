// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:rental_mobile/views/dashboard/home.dart';

class VoucherScreen extends StatefulWidget {
  const VoucherScreen({Key? key});

  @override
  _VoucherScreenState createState() => _VoucherScreenState();
}

class _VoucherScreenState extends State<VoucherScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Rental Mobil Horayy'),
      ),
      // ignore: sized_box_for_whitespace
      body: SingleChildScrollView(
        // ignore: sized_box_for_whitespace
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Container(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 100),
                    child: const Center(
                      child: Column(
                        children: [
                          // ignore: unnecessary_const
                          const Text(
                            'If you have a promo code.',
                            style: TextStyle(fontSize: 15),
                          ),
                          Text(
                            'please enter it',
                            style: TextStyle(fontSize: 15),
                          ),
                          Text(
                            'So you can enjoy our special',
                            style: TextStyle(fontSize: 15),
                          ),
                          Text(
                            'price that we made for you <3',
                            style: TextStyle(fontSize: 15),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 55.0, right: 55.0, top: 55),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        border: UnderlineInputBorder(),
                        labelText: 'Enter Promo Code',
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    margin: const EdgeInsets.only(top: 60, right: 15),
                    child: SizedBox(
                      height: 40,
                      width: 100,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red),
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const HomeScreen(),
                            ),
                          );
                        },
                        child: const Text('Continue'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
