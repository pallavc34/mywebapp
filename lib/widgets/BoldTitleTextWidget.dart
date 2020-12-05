import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mywebapp/responsive_widget.dart';

class BoldTitleTextWidget extends StatelessWidget {
  BoldTitleTextWidget({
    @required this.currentTheme,
    @required this.text,
  });

  final ThemeData currentTheme;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.averageSans(
          fontSize: isLargeScreen(context) == true ? 50 : 30,
          fontWeight: FontWeight.w400,
          color: currentTheme.focusColor),
    );
  }
}