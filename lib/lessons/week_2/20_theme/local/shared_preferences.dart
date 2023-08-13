
import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {

  static Future<void> setThemeID({String? value}) async {
    SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
    sharedPreferences.setString("AppThemeID", value!);
  }

  static Future<String> getThemeID() async {
    SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
    return sharedPreferences.getString("AppThemeID")!;
  }
}