import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier{
  ThemeData getCurrentTheme = ThemeData.light().copyWith(
      hintColor: Color(0XFFe1bee7),
      visualDensity: VisualDensity.adaptivePlatformDensity,
      backgroundColor: Colors.white,
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
        hintColor: Color(0XFFe1bee7),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        backgroundColor: Colors.white,
        focusColor: Colors.black
    );
    return lighttheme;
  }

  ThemeData getDarkTheme(){
    ThemeData darktheme = ThemeData.dark().copyWith(
      hintColor: Color(0XFFe1bee7),
      visualDensity: VisualDensity.adaptivePlatformDensity,
      backgroundColor: Colors.black,
      focusColor: Colors.white,
    );
    return darktheme;
  }
}