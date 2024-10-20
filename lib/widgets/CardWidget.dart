import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mywebapp/Provider/ThemeProvider.dart';
import 'package:mywebapp/constants.dart';
import 'package:provider/provider.dart';

class CardWidget extends StatelessWidget {

  final String title;
  final Color iconColor;
  final IconData iconData;
  final String subtitle;

  const CardWidget({required this.title, required this.iconColor, required this.iconData, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    var currentTheme = Provider.of<ThemeProvider>(context,listen:false).getCurrentTheme;
    var isDark = Provider.of<ThemeProvider>(context,listen:false).isDark;
    return Padding(
      padding: const EdgeInsets.only(right: 20.0,bottom: 20.0),
      child: Card(
        elevation: 20.0,
        color: currentTheme.colorScheme.surface,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0),
        ),
        shadowColor: !isDark ? Colors.black.withOpacity(0.5) : Colors.white.withOpacity(0.5),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FaIcon(
                iconData,
                size: 50.0,
                color: iconColor,
              ),
              SizedBox(height: 5.0,),
              Text(
                title,
                style: TextStyle(color: currentTheme.focusColor,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5.0,),
              Text(
                subtitle,
                style: TextStyle(color: currentTheme.focusColor,),
                textAlign: TextAlign.start,
                maxLines: 6,
              )
            ],
          ),
        ),
      ),
    );
  }
}
