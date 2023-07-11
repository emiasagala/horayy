import 'package:flutter/material.dart';
import 'package:rental_mobile/views/users/signin.dart';

class CompletedScreen extends StatefulWidget {
  const CompletedScreen({Key? key});

  @override
  _CompletedScreenState createState() => _CompletedScreenState();
}

class _CompletedScreenState extends State<CompletedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('FORGET PASSWORD'),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Container(
          padding: EdgeInsets.all(20.0),
          child: Form(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 100),
                  child: Center(
                    child: Column(
                      children: [
                        Text(
                          'NEW PASSWORD HAS BEEN UPDATED !',
                          style: TextStyle(fontSize: 15),
                        ),
                        Text(
                          'BACK TO LOGIN',
                          style: TextStyle(fontSize: 15),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginScreen(),
                      ),
                    );
                  },
                  child: Text('Continue'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
