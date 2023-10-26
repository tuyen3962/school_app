import 'package:school_web_management/common/constant/storage_key.dart';
import 'package:school_web_management/common/repo/base_repo.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StorageRepo extends BaseRepo {
  StorageRepo._();

  static late final SharedPreferences _preferences;

  static late StorageRepo? _instance = null;

  static Future<void> createInstance() async {
    if (_instance == null) {
      _preferences = await SharedPreferences.getInstance();
      _instance = StorageRepo._();
    }
  }

  static StorageRepo get instance => _instance!;

  Future<bool> saveToken(String token) =>
      _preferences.setString(StorageKey.tokenKey, token);

  String getToken() => _preferences.getString(StorageKey.tokenKey) ?? '';

  Future<bool> saveUserData(String data) =>
      _preferences.setString(StorageKey.userKey, data);
}
