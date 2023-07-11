import 'package:flutter/material.dart';
import 'package:rental_mobile/views/forgotPassword/forgotpassword.dart';

class VerifScreen extends StatefulWidget {
  const VerifScreen({Key? key});

  @override
  _VerifScreenState createState() => _VerifScreenState();
}

class _VerifScreenState extends State<VerifScreen> {
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
                          'ENTER A CODE THAT WEVE SEND TO',
                          style: TextStyle(fontSize: 15),
                        ),
                        Text(
                          'YOUR EMAIL/NUMBER PHONE',
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
                      labelText: 'Input Code Verification',
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
                        builder: (context) => NewPassword(),
                      ),
                    );
                  },
                  child: Text('Next'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
