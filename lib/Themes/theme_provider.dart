import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:harmonia/Themes/dark_mode.dart';
import 'package:harmonia/Themes/light_mode.dart';

class ThemeProvider extends ChangeNotifier{
  // Light mode
  ThemeData _themeData = lightMode;

  //get theme
  ThemeData get themeData => _themeData;

  // is dark mode
  bool get isDarkMode => _themeData == darkMode;

  // set theme
  set themeData(ThemeData themeData){
    _themeData = themeData;

    //update UI
    notifyListeners();
  }
  //toggle theme
void toggleTheme(){
    if (_themeData == lightMode){
      themeData = darkMode;
    } else {
      themeData = lightMode;
    }
}

}