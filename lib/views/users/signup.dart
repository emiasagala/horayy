// ignore_for_file: unnecessary_const

import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:rental_mobile/models/NewUserModel.dart';
import 'package:rental_mobile/providers/newUserProvider.dart';
import 'package:rental_mobile/views/users/signin.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:uuid/uuid.dart';

class RegistScreen extends StatefulWidget {
  const RegistScreen({Key? key});

  @override
  _RegistScreenState createState() => _RegistScreenState();
}

class _RegistScreenState extends State<RegistScreen> {
  final TextEditingController _inputUsernameController =
      TextEditingController();
  final TextEditingController _inputEmailUserController =
      TextEditingController();
  final TextEditingController _inputNumberController = TextEditingController();
  final TextEditingController _inputPasswordUserController =
      TextEditingController();

  void myNotif(String msg, Color color) {
    Fluttertoast.showToast(
        msg: msg,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: color,
        textColor: Colors.black,
        fontSize: 16.0);
  }

  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<UserLoginProvider>(context);
    final uuid = Uuid();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Regist Account'),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Container(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              child: Column(
                children: [
                  Container(
                    decoration: const BoxDecoration(shape: BoxShape.circle),
                    child: Center(
                      child: Image.asset(
                        'assets/bg-pp.png',
                        width: 200,
                        height: 100,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 13),
                    child: const Center(
                      child: const Text(
                        'Please Login Your Account!',
                        style: const TextStyle(fontSize: 15),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 55.0, right: 55.0, top: 55),
                    child: TextFormField(
                      controller: _inputUsernameController,
                      decoration: const InputDecoration(
                        border: UnderlineInputBorder(),
                        labelText: 'Full Name',
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 55.0, right: 55.0),
                    child: TextFormField(
                      controller: _inputEmailUserController,
                      decoration: const InputDecoration(
                        border: UnderlineInputBorder(),
                        labelText: 'Email',
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 55.0, right: 55.0),
                    child: TextFormField(
                      controller: _inputNumberController,
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
                  Padding(
                    padding: const EdgeInsets.only(left: 55.0, right: 55.0),
                    child: TextFormField(
                      controller: _inputPasswordUserController,
                      decoration: const InputDecoration(
                        border: UnderlineInputBorder(),
                        labelText: 'Password',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(height: 20),
                  Column(
                    children: [
                      SizedBox(height: 40),
                      RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          style: DefaultTextStyle.of(context).style,
                          children: [
                            TextSpan(
                              text: "Already have an account? ",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                decoration: TextDecoration.none,
                              ),
                            ),
                            TextSpan(
                              text: 'Login',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                decoration: TextDecoration.none,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.pushReplacement(context,
                                      MaterialPageRoute(builder: (context) {
                                    return LoginScreen();
                                  }));
                                },
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red),
                        onPressed: () {
                          if (_inputUsernameController.text != '' ||
                              _inputEmailUserController.text != '' ||
                              _inputNumberController.text != '' ||
                              _inputPasswordUserController.text != '') {
                            prov.register(NewUser(
                                id: uuid.v1(),
                                username: _inputUsernameController.text,
                                email: _inputEmailUserController.text,
                                noHp: _inputNumberController.text,
                                password: _inputPasswordUserController.text));

                            myNotif('Your Account is Successfully Created',
                                Colors.cyan);
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (context) => LoginScreen()));
                          } else {
                            myNotif('Failed, Your Data is Not Complete',
                                Colors.red);
                          }
                        },
                        child: Text('Sign Up'),
                      ),
                    ],
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
