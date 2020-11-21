import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mywebapp/responsive_widget.dart';
import 'package:url_launcher/url_launcher.dart';

class CardWidget extends StatelessWidget {
  CardWidget(
      {@required this.URL, @required this.name, @required this.imgLocation});

  final String URL;
  final String name;
  final String imgLocation;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        launch(URL);
      },
      child: Padding(
        padding: EdgeInsets.only(
          left: 10,
          right: isLargeScreen(context) == true ? 15 : 10,
          top: 10,
          bottom: isLargeScreen(context) == true ? 10 : 15,
        ),
        child: Card(
          child: Container(
            padding: EdgeInsets.all(10.0),
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(25.0),
                  child: Container(
                      width: isLargeScreen(context) == true ? 450 : 400,
                      height: isLargeScreen(context) == true ? 450 : 400,
                      child: Image.asset(
                        imgLocation,
                        fit: BoxFit.fill,
                      )),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  name,
                  style: GoogleFonts.averageSans(
                      fontSize: isLargeScreen(context) == true ? 50.0 : 30.0,
                      color: Colors.blue.shade600),
                ),
              ],
            ),
          ),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0)),
        ),
      ),
    );
  }
}
