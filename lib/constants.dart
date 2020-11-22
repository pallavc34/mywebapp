import 'package:flutter/material.dart';

class MyConstants{

  ThemeData getlightTheme(){
    ThemeData lighttheme = ThemeData.light().copyWith(
        accentColor: Colors.deepPurple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        backgroundColor: Colors.white,
        focusColor: Colors.black
    );
    return lighttheme;
  }

  ThemeData getdarkTheme(){
    ThemeData darktheme = ThemeData.dark().copyWith(
      accentColor: Colors.deepPurple,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      backgroundColor: Colors.black,
      focusColor: Colors.white,
    );
    return darktheme;
  }

  ThemeData getCurrentTheme(IconData myIcon){
    if (myIcon == Icons.wb_sunny){
      return getlightTheme();
    } else {
      return getdarkTheme();
    }
  }
}