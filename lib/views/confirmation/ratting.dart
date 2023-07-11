import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:rental_mobile/views/confirmation/messageApp.dart';

class RattingScreen extends StatefulWidget {
  @override
  _RattingScreenState createState() => _RattingScreenState();
}

class _RattingScreenState extends State<RattingScreen> {
  late final _ratingController;
  late double _rating;

  double _userRating = 3.0;
  int _ratingBarMode = 1;
  double _initialRating = 2.0;
  bool _isRTLMode = false;
  bool _isVertical = false;

  IconData? _selectedIcon;

  @override
  void initState() {
    super.initState();
    _ratingController = TextEditingController(text: '3.0');
    _rating = _initialRating;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rental Mobil Horayy'),
      ),
      body: Directionality(
        textDirection: _isRTLMode ? TextDirection.rtl : TextDirection.ltr,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            SizedBox(
              height: 40.0,
            ),
            Container(
              margin: const EdgeInsets.only(top: 20),
              child: const Text(
                "Ratting Session",
                style: TextStyle(color: Colors.red, fontSize: 25),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 30),
              child: const Divider(),
            ),
            SizedBox(height: 40.0),
            _heading('Rating Indicator'),
            RatingBarIndicator(
              rating: _userRating,
              itemBuilder: (context, index) => Icon(
                _selectedIcon ?? Icons.star,
                color: Colors.amber,
              ),
              itemCount: 5,
              itemSize: 50.0,
              unratedColor: Colors.amber.withAlpha(50),
              direction: _isVertical ? Axis.vertical : Axis.horizontal,
            ),
            SizedBox(height: 20.0),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: TextFormField(
                controller: _ratingController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter rating',
                  labelText: 'Enter rating',
                  suffixIcon: MaterialButton(
                    onPressed: () {
                      _userRating =
                          double.parse(_ratingController.text ?? '0.0');
                      setState(() {});
                    },
                    child: Text('Rate'),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.arrow_circle_right),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: ((context) => MessageScreen()),
              ),
            );
          }),
    );
  }

  Widget _ratingBar(int mode) {
    switch (mode) {
      case 1:
        return RatingBar.builder(
          initialRating: _initialRating,
          minRating: 1,
          direction: _isVertical ? Axis.vertical : Axis.horizontal,
          allowHalfRating: true,
          unratedColor: Colors.amber.withAlpha(50),
          itemCount: 5,
          itemSize: 50.0,
          itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
          itemBuilder: (context, _) => Icon(
            _selectedIcon ?? Icons.star,
            color: Colors.amber,
          ),
          onRatingUpdate: (rating) {
            setState(() {
              _rating = rating;
            });
          },
          updateOnDrag: true,
        );

      default:
        return Container();
    }
  }

  Widget _heading(String text) => Column(
        children: [
          Text(
            text,
            style: TextStyle(
              fontWeight: FontWeight.w300,
              fontSize: 24.0,
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
        ],
      );
}
