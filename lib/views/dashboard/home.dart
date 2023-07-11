// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:rental_mobile/main.dart';
import 'package:rental_mobile/views/confirmation/historyBooking.dart';
import 'package:rental_mobile/views/confirmation/ratting.dart';
import 'package:rental_mobile/views/drawerPage/aboutUs.dart';
import 'package:rental_mobile/views/booking/confirmTakeCar.dart';
import 'package:rental_mobile/Models/CarModel.dart';
import 'package:rental_mobile/views/drawerPage/listCar.dart';
import 'package:rental_mobile/views/users/signin.dart';
import 'package:uuid/uuid.dart';

bool tema = false;

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
          'KATALOG MOBIL HORAYY',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      drawer: Drawer(
        child: Container(
          // color: Colors.grey[200],
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              Container(
                height: 100,
                child: DrawerHeader(
                  decoration: BoxDecoration(
                    color: Colors.cyan,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Rental Mobil',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Card(
                child: ListTile(
                  leading: Icon(Icons.contact_support),
                  title: Text('AboutUs'),
                  iconColor: Colors.blueGrey,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AboutUsScreen(),
                      ),
                    );
                  },
                ),
              ),
              Card(
                child: ListTile(
                  leading: Icon(Icons.car_rental),
                  iconColor: Colors.red,
                  title: Text('List Car'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ListCarScreen(),
                      ),
                    );
                  },
                ),
              ),
              Card(
                child: ListTile(
                  leading: Icon(Icons.list),
                  title: Text('History Booking'),
                  iconColor: Colors.blueGrey,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HistoryScreen(),
                      ),
                    );
                  },
                ),
              ),
              Card(
                child: ListTile(
                  leading: Icon(Icons.star),
                  title: Text('Ratting App'),
                  iconColor: Colors.yellow,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RattingScreen(),
                      ),
                    );
                  },
                ),
              ),
              Card(
                child: ListTile(
                  leading:
                      tema ? Icon(Icons.light_mode) : Icon(Icons.dark_mode),
                  title: Text('Switch Mode'),
                  trailing: Switch(
                    value: tema,
                    activeColor: Colors.white,
                    onChanged: (bool value) {
                      MyApp.themeNotifier.value =
                          MyApp.themeNotifier.value == ThemeMode.light
                              ? ThemeMode.dark
                              : ThemeMode.light;
                      setState(
                        () {
                          tema = value;
                        },
                      );
                    },
                  ),
                ),
              ),
              Card(
                child: ListTile(
                  leading: Icon(Icons.logout),
                  iconColor: Colors.purple,
                  title: Text('Logout'),
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginScreen(),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(16),
              margin: EdgeInsets.only(left: 5, right: 5, top: 14),
              decoration: BoxDecoration(
                color: Colors.cyan,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(40.0),
                    bottomRight: Radius.circular(40.0),
                    topLeft: Radius.circular(40.0),
                    bottomLeft: Radius.circular(40.0)),
              ),
              child: Text(
                'Recommended',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
              width: double.infinity,
            ),
            SizedBox(
              height: 170,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: listData.length,
                shrinkWrap: true,
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () {},
                  child: Column(
                    children: [
                      Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(18),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(listData[index].img),
                          ),
                        ),
                      ),
                      Text(
                        listData[index].merk,
                        style: TextStyle(color: Colors.cyan),
                      ),
                      Text(
                        listData[index].price,
                        style: TextStyle(color: Colors.grey),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(16),
              margin: EdgeInsets.only(left: 5, right: 5, top: 8),
              decoration: BoxDecoration(
                color: Colors.cyan,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(40.0),
                    bottomRight: Radius.circular(40.0),
                    topLeft: Radius.circular(40.0),
                    bottomLeft: Radius.circular(40.0)),
              ),
              child: Text(
                'Top Chart',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
              width: double.infinity,
            ),
            ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: listData.length,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) => GestureDetector(
                onTap: () {
                  Navigator.push(
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
