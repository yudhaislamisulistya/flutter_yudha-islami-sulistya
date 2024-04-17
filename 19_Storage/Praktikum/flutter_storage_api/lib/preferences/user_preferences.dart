import 'package:flutter_storage_api/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  static SharedPreferences? _preferences;

  static Future init() async => _preferences = await SharedPreferences.getInstance();

  static Future setUserLoggedIn(bool value) async => await _preferences!.setBool('is_logged_in', value);
  static Future setUser(UserModel user) async {
    await _preferences!.setInt('id', user.id!);
    await _preferences!.setString('username', user.username);
    await _preferences!.setString('password', user.password);
  }

  static bool? getUserLoggedIn() => _preferences!.getBool('is_logged_in');
  static int? getUserId() => _preferences!.getInt('id');
  static String? getUsername() => _preferences!.getString('username');
  static String? getPassword() => _preferences!.getString('password');
}
