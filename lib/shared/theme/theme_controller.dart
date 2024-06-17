import 'package:flutter/cupertino.dart';

class ThemeController extends ChangeNotifier{
  static ThemeController theme = ThemeController();

  bool isDark = true;

  changeTheme(){
    isDark = !isDark;

    notifyListeners();
  }
}