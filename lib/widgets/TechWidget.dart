import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class TechWidget extends StatelessWidget {
  final String imageString;
  final String launchURL;
  final String appText;

  TechWidget(
      {required this.imageString,
      required this.launchURL,
      required this.appText});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        launch(launchURL);
      },
      child: Column(
        children: [
          Container(
              width: 80,
              height: 80,
              child: Image.asset(imageString)),
          Text(appText,style: TextStyle(
              color: Colors.black
          ),),
        ],
      ),
    );
  }
}
