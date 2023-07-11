import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rental_mobile/providers/CarProvider.dart';
import 'package:rental_mobile/providers/bookingProvider.dart';

class HistoryScreen extends StatefulWidget {
  @override
  _HistoryScreen createState() => _HistoryScreen();
}

class _HistoryScreen extends State<HistoryScreen> {
  @override
  Widget build(BuildContext context) {
    BookingProvider booking = Provider.of<BookingProvider>(context);
    CarProvider car = Provider.of<CarProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('History Booking'),
      ),
      body: ListView.builder(
        shrinkWrap: true,
        itemCount: booking.BookingLIst.length,
        itemBuilder: (context, index) {
          final data = booking.BookingLIst[index];
          final datapayment = car.OrderList[index];
          return Container(
            child: Row(
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.all(14),
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(data.item.img),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      data.nama.toUpperCase(),
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 5, top: 5),
                      child: Text(
                        data.tanggal,
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    Text(
                      data.item.price,
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      datapayment.jenis,
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                Container(
                  margin: EdgeInsets.only(right: 20),
                  child: IconButton(
                    icon: !booking.BookingLIst.contains(data)
                        ? Icon(Icons.delete)
                        : Icon(
                            Icons.delete,
                            color: Colors.red,
                          ),
                    onPressed: () {
                      if (!booking.BookingLIst.contains(data)) {
                        booking.addCar(data);
                      } else {
                        booking.removeCar(data);
                      }
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
