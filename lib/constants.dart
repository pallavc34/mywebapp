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

  static String introduction = "Innovative | Self-Motivated | Ambitious. "
      + "I am driven by the desire to leave a mark on the world. Professionally, "
      + "I work as a Java developer in TCS Limited. "
      + "I specialize in designing, developing and debugging frontend UI in banking domain. "
      + "I am an engineer by profession and developer by passion."
      + "I am passionate about developing native Android and cross platform apps with flutter framework. ";
}