import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier{
  ThemeData getCurrentTheme = ThemeData.light().copyWith(
    colorScheme: ColorScheme.light(surface: Colors.white),
      hintColor: Color(0XFFe1bee7),
      visualDensity: VisualDensity.adaptivePlatformDensity,
      focusColor: Colors.black
  );
  bool isDark = false;

  void changeTheme(){
    if (isDark){
      getCurrentTheme = getLightTheme();
      isDark = false;
    } else {
      getCurrentTheme = getDarkTheme();
      isDark = true;
    }
    notifyListeners();
  }

  ThemeData getLightTheme(){
    ThemeData lighttheme = ThemeData.light().copyWith(
        colorScheme: ColorScheme.light(surface: Colors.white),
        hintColor: Color(0XFFe1bee7),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        focusColor: Colors.black
    );
    return lighttheme;
  }

  ThemeData getDarkTheme(){
    ThemeData darktheme = ThemeData.dark().copyWith(
      colorScheme: ColorScheme.dark(surface: Colors.black),
      hintColor: Color(0XFFe1bee7),
      visualDensity: VisualDensity.adaptivePlatformDensity,
      focusColor: Colors.white,
    );
    return darktheme;
  }
}