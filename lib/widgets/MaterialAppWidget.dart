import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import '../Provider/ThemeProvider.dart';

class MaterialAppWidget extends StatefulWidget {
  final String text;
  final String subtext;
  final String image;
  final String url;
  const MaterialAppWidget(
      {Key? key,
      required this.text,
      required this.subtext,
      required this.image,
      required this.url})
      : super(key: key);

  @override
  State<MaterialAppWidget> createState() => _MaterialAppWidgetState();
}

class _MaterialAppWidgetState extends State<MaterialAppWidget> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (BuildContext context, themeValue, Widget? child) {
        return GestureDetector(
          onTap: () {
            launch(widget.url);
          },
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            elevation: 30.0,
            color: Colors.white,
            child: Container(
              width: 300,
              height: 300,
              padding: EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                          width: 280,
                          height: 190,
                          child: Image.asset(
                            widget.image,
                            fit: BoxFit.fill,
                          ))),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    widget.text,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: GoogleFonts.aBeeZee(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w400,
                        color: themeValue.getCurrentTheme.focusColor),
                    textAlign: TextAlign.start,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(widget.subtext,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: GoogleFonts.aBeeZee(
                          color: themeValue.getCurrentTheme.focusColor,
                          fontSize: 15.0,
                          fontWeight: FontWeight.w400),
                      textAlign: TextAlign.start),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
