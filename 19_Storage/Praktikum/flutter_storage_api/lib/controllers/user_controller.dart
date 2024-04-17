// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_storage_api/helpers/database.dart';
import 'package:flutter_storage_api/models/user_model.dart';
import 'package:flutter_storage_api/preferences/user_preferences.dart';

class UserController with ChangeNotifier {
  UserModel? _user;
  bool _isLoggedIn = false;

  bool get isLoggedIn => _isLoggedIn;
  UserModel? get user => _user;

  void loginUser(String username, String password) async {
    var dbHelper = DatabaseHelper();
    UserModel isUser = await dbHelper.checkUser(username, password);
    print("Ini merupakan data dari controller");
    print(isUser.password);
    print(isUser.username);
    print(isUser.id);

    if (isUser.username != '' && isUser.password != '') {
      print("Berhasil login dan masuk ke kondisi ini");
      _user = isUser;
      _isLoggedIn = true;
      UserPreferences.setUserLoggedIn(_isLoggedIn);
      UserPreferences.setUser(_user!);
      notifyListeners();
    }
  }

  void logoutUser() {
    _isLoggedIn = false;
    UserPreferences.setUserLoggedIn(_isLoggedIn);
    notifyListeners();
  }
}
