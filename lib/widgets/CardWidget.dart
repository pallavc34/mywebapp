import 'package:flutter/material.dart';
import 'package:mywebapp/constants.dart';

class CardWidget extends StatelessWidget {

  final String title;
  final Color iconColor;
  final IconData iconData;
  final IconData themeData;
  final String subtitle;

  const CardWidget({this.title, this.iconColor, this.iconData, this.subtitle,@required this.themeData});

  @override
  Widget build(BuildContext context) {
    var currentTheme = MyConstants().getCurrentTheme(themeData);
    return Padding(
      padding: const EdgeInsets.only(right: 20.0,bottom: 20.0),
      child: Card(
        elevation: 20.0,
        color: currentTheme.backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0),
          side: BorderSide(
            color: themeData == Icons.wb_sunny ? Colors.black.withOpacity(0.7) : Colors.white.withOpacity(0.7),
          ),
        ),
        shadowColor:themeData == Icons.wb_sunny ? Colors.black.withOpacity(0.5) : Colors.white.withOpacity(0.5),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment:
            CrossAxisAlignment.start,
            children: [
              Icon(
                iconData,
                size: 50.0,
                color: iconColor,
              ),
              Text(
                title,
                style: TextStyle(color: currentTheme.focusColor,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                subtitle,
                style: TextStyle(color: currentTheme.focusColor,),
                textAlign: TextAlign.start,
              )
            ],
          ),
        ),
      ),
    );
  }
}
