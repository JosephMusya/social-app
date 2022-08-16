// ignore: import_of_legacy_library_into_null_safe
import 'package:shared_preferences/shared_preferences.dart';

class UserSharedPreferences {
  // ignore: unused_field
  static late SharedPreferences _prefs;

  static const _keyUsername = 'username';
  static const _keyPost = 'post';

  static Future init() async => _prefs = await SharedPreferences.getInstance();

  static Future setUsername(String _username) =>
      _prefs.setString(_keyUsername, _username);

  static Future setPost(List<String> _post) =>
      _prefs.setStringList(_keyPost, _post);

  static getUsername() => _prefs.getString(_keyUsername);
  static getPosts() => _prefs.getStringList(_keyPost);
}
