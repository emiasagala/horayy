import 'package:flutter/material.dart';
import 'package:rental_mobile/views/forgotPassword/completed.dart';

class NewPassword extends StatefulWidget {
  const NewPassword({Key? key});

  @override
  _NewPasswordState createState() => _NewPasswordState();
}

class _NewPasswordState extends State<NewPassword> {
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
                      labelText: 'Enter New Password',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 55.0, right: 55.0),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'Confirm New Password',
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
                          builder: (context) => CompletedScreen(),
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
