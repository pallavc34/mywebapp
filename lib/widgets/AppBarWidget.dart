import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mywebapp/Provider/ThemeProvider.dart';
import 'package:mywebapp/constants.dart';
import 'package:provider/provider.dart';

import '../responsive_widget.dart';

class AppBarWidget extends StatefulWidget {
  const AppBarWidget({Key? key}) : super(key: key);

  @override
  State<AppBarWidget> createState() => _AppBarWidgetState();
}

class _AppBarWidgetState extends State<AppBarWidget> {
  IconData myThemeIcon = FontAwesomeIcons.toggleOff;
  Color myThemeIconColor = Colors.black;

  @override
  Widget build(BuildContext context) {
    return AppBar(
        backgroundColor: MyConstants.accentColor,
        title: Consumer<ThemeProvider>(
          builder: (BuildContext context, themeValue, Widget? child) {
            return Container(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        width: 40,
                        height: 40,
                        child: Image.asset("images/icon-512.png")),
                    SizedBox(width: 8.0,),
                    Expanded(
                      child: Text(
                        "A Passionate Developers Creation",
                        style: GoogleFonts.averageSans(
                          fontSize: isLargeScreen(context) == true ? 30 : 25,
                          color: Colors.black,
                        ),
                        maxLines: 2,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ));
  }

}
