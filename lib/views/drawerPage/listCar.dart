// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:rental_mobile/views/booking/confirmTakeCar.dart';
import 'package:rental_mobile/Models/CarModel.dart';
import 'package:uuid/uuid.dart';

bool tema = false;

class ListCarScreen extends StatefulWidget {
  const ListCarScreen({Key? key});

  @override
  _ListCarScreenState createState() => _ListCarScreenState();
}

class _ListCarScreenState extends State<ListCarScreen> {
  var uuid = Uuid();

  List<Item> listData = [
    Item(
        id: Uuid().v1(),
        img: "assets/mb1.png",
        merk: "TOYOTA ALPHARD",
        price: "1.000.000"),
    Item(
        id: Uuid().v1(),
        img: "assets/mb2.png",
        merk: "TOYOTA AGYA",
        price: "350.000"),
    Item(
        id: Uuid().v1(),
        img: "assets/mb3.png",
        merk: "TOYOTA INOVA",
        price: "450.000"),
    Item(
        id: Uuid().v1(),
        img: "assets/mb4.png",
        merk: "MITSUBISHI PAJERO",
        price: "750.000"),
    Item(
        id: Uuid().v1(),
        img: "assets/mb5.png",
        merk: "TOYOTA TERIOS",
        price: "300.000"),
    Item(
        id: Uuid().v1(),
        img: "assets/mb6.png",
        merk: "TOYOTA AVANZA",
        price: "300.000"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'LIST MOBIL HORAYY',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: listData.length,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) => GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          TakeCarScreen(item: listData[index]),
                    ),
                  );
                },
                child: Container(
                  margin: EdgeInsets.all(5.0),
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          ListTile(
                            leading: Image.asset(listData[index].img),
                            title: Text(listData[index].merk),
                            subtitle: Text(listData[index].price),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
