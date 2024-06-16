import 'package:flutter/cupertino.dart';

class ThemeController extends ChangeNotifier{
  static ThemeController theme = ThemeController();

  bool isDark = false;

  changeTheme(){
    isDark = !isDark;

    notifyListeners();
  }
}