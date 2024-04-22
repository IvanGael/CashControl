
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserFirstTimeProvider extends ChangeNotifier{
  bool _isUserFirstTime = false;

  void checkUserFirstTime() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isFirstTime = prefs.getBool('isFirstTime') ?? true;
    _isUserFirstTime = isFirstTime;
    notifyListeners();
  }

  UserFirstTimeProvider(){
    checkUserFirstTime();
  }


  bool get isUserFirstTime => _isUserFirstTime;
}