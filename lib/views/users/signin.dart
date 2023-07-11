import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:rental_mobile/providers/newUserProvider.dart';
import 'package:rental_mobile/views/dashboard/home.dart';
import 'package:rental_mobile/views/forgotPassword/findEmail.dart';
import 'package:rental_mobile/views/users/signup.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _inputEmailUserController =
      TextEditingController();
  final TextEditingController _InputPasswordUserController =
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
    final provLogin = Provider.of<UserLoginProvider>(context);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('WELCOME'),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Container(
            padding: EdgeInsets.all(20.0),
            child: Form(
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(shape: BoxShape.circle),
                    child: Center(
                      child: Image.asset(
                        'assets/bg-pp.png',
                        width: 200,
                        height: 100,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 13),
                    child: Center(
                      child: Text(
                        'Please Login Your Account!',
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 55.0, left: 55.0, right: 55.0),
                    child: TextFormField(
                      controller: _inputEmailUserController,
                      decoration: const InputDecoration(
                        border: UnderlineInputBorder(),
                        labelText: 'Enter your username',
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 55.0, right: 55.0),
                    child: TextFormField(
                      controller: _InputPasswordUserController,
                      decoration: const InputDecoration(
                        border: UnderlineInputBorder(),
                        labelText: 'Enter your Password',
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Column(
                    children: [
                      SizedBox(height: 20),
                      RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          style: DefaultTextStyle.of(context).style,
                          children: [
                            TextSpan(
                              text: 'Forgot Password ?',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                decoration: TextDecoration.none,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => FindEmail()));
                                },
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20),
                      RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          style: DefaultTextStyle.of(context).style,
                          children: [
                            TextSpan(
                              text: "Don't have an account? ",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                decoration: TextDecoration.none,
                              ),
                            ),
                            TextSpan(
                              text: 'Sign Up',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                decoration: TextDecoration.none,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              RegistScreen()));
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
                          final isFound = provLogin.userLoginList.any((user) =>
                              user.email == _inputEmailUserController.text &&
                              user.password ==
                                  _InputPasswordUserController.text);
                          if (isFound) {
                            //ambil data yg login itu
                            final dataUser = provLogin.userLoginList.firstWhere(
                              (user) =>
                                  user.email ==
                                      _inputEmailUserController.text &&
                                  user.password ==
                                      _InputPasswordUserController.text,
                            );

                            //simpan id user yg login
                            provLogin.userDoLogin(dataUser.id);

                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (context) => HomeScreen()));

                            //jika userlogin tidak ditemukan maka muncul notif
                          } else {
                            myNotif('Your Password or Email is incorrect',
                                Colors.red);
                          }
                        },
                        child: Text('Sign In'),
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
