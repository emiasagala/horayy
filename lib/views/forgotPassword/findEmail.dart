import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rental_mobile/views/forgotPassword/codeVerif.dart';

class FindEmail extends StatefulWidget {
  const FindEmail({Key? key});

  @override
  _FindEmailState createState() => _FindEmailState();
}

class _FindEmailState extends State<FindEmail> {
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
                Padding(
                  padding: const EdgeInsets.all(55.0),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'Enter your Email',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 55.0, right: 55.0),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'Phone Number',
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  margin: EdgeInsets.only(top: 25.0),
                  child: ElevatedButton(
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.red),
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => VerifScreen(),
                        ),
                      );
                    },
                    child: Text('Next'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
