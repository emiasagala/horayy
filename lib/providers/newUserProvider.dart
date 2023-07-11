import 'package:flutter/material.dart';
import 'package:rental_mobile/models/NewUserModel.dart';
import 'package:uuid/uuid.dart';

class UserLoginProvider with ChangeNotifier {
  final uuid = Uuid();
  List<NewUser> _userLoginList = [
    NewUser(
        id: Uuid().v1(),
        username: 'aldi',
        email: 'aldi',
        noHp: '082366369129',
        password: '1234'),
  ];

  List<NewUser> get userLoginList => _userLoginList;

  String _idUserDoLogin = '';
  String get idUserDoLogin => _idUserDoLogin;

  void userDoLogin(id) {
    _idUserDoLogin = id;
    notifyListeners();
  }

  void register(NewUser user) {
    print(user.username);
    _userLoginList.add(user);
    notifyListeners();
  }
}
