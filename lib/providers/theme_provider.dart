import 'package:cash_control/theme/theme_manager.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider with ChangeNotifier {
  ThemeData _themeData = ThemeManager().lightTheme;



  Future<ThemeData> getThemeDataAsync() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isDarkMode = prefs.getBool('isDarkMode') ?? true;

    return isDarkMode == true ? ThemeManager().darkTheme : _themeData;
  }


  ThemeData getThemeData(){
    getThemeDataAsync().then((value) => _themeData = value);
    return _themeData;
  }

  setThemeData(ThemeData themeData) {
    _themeData = themeData;
    notifyListeners();
  }


  void toggleTheme() async {
    if (_themeData == ThemeManager().lightTheme) {
      setThemeData(ThemeManager().darkTheme);
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setBool('isDarkMode', true);
    } else {
      setThemeData(ThemeManager().lightTheme);
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setBool('isDarkMode', false);
    }
  }
}
