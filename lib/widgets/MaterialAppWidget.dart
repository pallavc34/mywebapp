import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import '../constants.dart';

class MaterialAppWidget extends StatefulWidget {
  final String text;
  final String subtext;
  final String image;
  final Uri url;
  const MaterialAppWidget(
      {Key? key,
      required this.text,
      required this.subtext,
      required this.image, required this.url})
      : super(key: key);

  @override
  State<MaterialAppWidget> createState() => _MaterialAppWidgetState();
}

class _MaterialAppWidgetState extends State<MaterialAppWidget> {
  ThemeData currentTheme = MyConstants().getCurrentTheme(Icons.wb_sunny);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      /*onTap: (){
        _launchInBrowser(widget.url);
      },*/
      child: Container(
        width: 300,
        height: 300,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          elevation: 30.0,
          borderOnForeground: true,
          shadowColor: Colors.black,
          color: Colors.blue.shade200,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      width: 280,
                        height: 190,
                        child: Image.asset(widget.image,fit: BoxFit.fill,)
                    )
                ),
                Text(
                  widget.text,
                  style: GoogleFonts.aBeeZee(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w400,
                      color: currentTheme.focusColor),
                  textAlign: TextAlign.start,
                ),
                Text(widget.subtext,
                    style: GoogleFonts.aBeeZee(
                        color: currentTheme.focusColor,
                        fontSize: 15.0,
                        fontWeight: FontWeight.w400),
                    textAlign: TextAlign.start),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _launchInBrowser(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw 'Could not launch $url';
    }
  }
}
