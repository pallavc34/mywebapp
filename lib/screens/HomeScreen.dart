import 'dart:math';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mywebapp/responsive_widget.dart';
import 'package:mywebapp/widgets/CardWidget.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatefulWidget {
  static const String id = "home_screen";

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          padding: EdgeInsets.all(10.0),
                          child: Text('My Work'),
                        ),
                        Container(
                          padding: EdgeInsets.all(10.0),
                          child: Text('About Me'),
                        ),
                        Container(
                          padding: EdgeInsets.all(10.0),
                          child: Text('Get A Quote'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                child: Stack(
                  children: [
                    Container(
                      child: Image.asset(
                        "images/desktop.jpg",
                        fit: BoxFit.fill,
                      ),
                      width: double.infinity,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ResponsiveWidget(
                            largeScreen: SizedBox(
                              height: size.height * 0.4,
                            ),
                            smallScreen: SizedBox(
                              height: 20.0,
                            ),
                          ),
                          Text(
                            "Pallav Chaudhari",
                            style: GoogleFonts.averageSans(
                              fontSize:
                                  isLargeScreen(context) == true ? 75.0 : 30,
                              color: Colors.deepPurple,
                              fontWeight: FontWeight.w600,
                            ),
                            textAlign: TextAlign.left,
                          ),
                          Text(
                            "Creating change through innovation",
                            style: GoogleFonts.squadaOne(
                              fontSize:
                                  isLargeScreen(context) == true ? 73.0 : 27,
                              color: Colors.purple,
                              fontWeight: FontWeight.w600,
                            ),
                            textAlign: TextAlign.left,
                          ),
                          TypewriterAnimatedTextKit(
                            text: [
                              "I am cross platform app developer",
                              "Designing cool apps in free time",
                              "Engineer by Passion",
                              "Programmer by profession",
                            ],
                            speed: Duration(milliseconds: 250),
                            textStyle: GoogleFonts.aBeeZee(
                                fontSize:
                                    isLargeScreen(context) == true ? 70.0 : 25,
                                color: Colors.purple.shade200),
                          ),
                          ResponsiveWidget(
                            largeScreen: SizedBox(
                              height: size.height * 0.4,
                            ),
                            smallScreen: SizedBox(
                              height: 5.0,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Container(
                child: Column(
                  children: [
                    SizedBox(height:isSmallScreen(context) == true ? 10.0 : 0.0,),
                    Text(
                      "My Work",
                      style: GoogleFonts.averageSans(
                          fontSize: isLargeScreen(context) == true ? 70.0 : 40,
                          fontWeight: FontWeight.w400,
                          color: Colors.purple.shade400),
                    ),
                    ResponsiveWidget(
                      largeScreen: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              CardWidget(
                                  URL:
                                      "https://play.google.com/store/apps/details?id=com.androidinmyblood.personaldairy",
                                  name: "Personal diary",
                                  imgLocation: "images/personaldiary.jpg"),
                              CardWidget(
                                  URL:
                                  "https://play.google.com/store/apps/details?id=com.andrdoc.signlanguage",
                                  name: "Indian SLT",
                                  imgLocation: "images/islrect.jpg"),
                              CardWidget(
                                  URL:
                                  "https://play.google.com/store/apps/details?id=com.androidinmyblood.personaldairy",
                                  name: "Personal diary",
                                  imgLocation: "images/personaldiary.jpg"),
                            ],
                          ),
                        ),
                      ),
                      smallScreen: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          children: [
                            CardWidget(
                                URL:
                                    "https://play.google.com/store/apps/details?id=com.androidinmyblood.personaldairy",
                                name: "Personal Diary",
                                imgLocation: "images/personaldiary.jpg"),
                            CardWidget(
                                URL:
                                "https://play.google.com/store/apps/details?id=com.andrdoc.signlanguage",
                                name: "Indian SLT",
                                imgLocation: "images/islrect.jpg"),
                            CardWidget(
                                URL:
                                "https://play.google.com/store/apps/details?id=com.androidinmyblood.personaldairy",
                                name: "Personal diary",
                                imgLocation: "images/personaldiary.jpg"),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
