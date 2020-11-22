import 'dart:math';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_emoji/flutter_emoji.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mywebapp/responsive_widget.dart';
import 'package:mywebapp/widgets/CardWidget.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:mywebapp/constants.dart';

class HomeScreen extends StatefulWidget {
  static const String id = "home_screen";

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  IconData myThemeIcon = Icons.wb_sunny;
  Color myThemeIconColor = Colors.yellow;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
          color: currentTheme.backgroundColor,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Pallav Chaudhari",
                      style: GoogleFonts.averageSans(
                        fontSize: 30.0,
                        color: currentTheme.focusColor,
                      ),
                    ),
                    ResponsiveWidget(
                      largeScreen: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          // Container(
                          //   padding: EdgeInsets.all(10.0),
                          //   child: Text('My Work',style: TextStyle(
                          //       color: currentTheme.focusColor
                          //   ),),
                          // ),
                          // Container(
                          //   padding: EdgeInsets.all(10.0),
                          //   child: Text('About Me',style: TextStyle(
                          //       color: currentTheme.focusColor
                          //   ),),
                          // ),
                          // Container(
                          //   padding: EdgeInsets.all(10.0),
                          //   child: Text('Get A Quote',style: TextStyle(
                          //     color: currentTheme.focusColor
                          //   ),),
                          // ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                if (myThemeIcon == Icons.brightness_2) {
                                  currentTheme = lighttheme;
                                  myThemeIcon = Icons.wb_sunny;
                                  myThemeIconColor = Colors.yellow;
                                } else {
                                  currentTheme = darktheme;
                                  myThemeIcon = Icons.brightness_2;
                                  myThemeIconColor = Colors.white;
                                }
                              });
                            },
                            child: Icon(
                              myThemeIcon,
                              color: myThemeIconColor,
                              size: 40.0,
                            ),
                          )
                        ],
                      ),
                      smallScreen: GestureDetector(
                        onTap: () {
                          setState(() {
                            if (myThemeIcon == Icons.brightness_2) {
                              currentTheme = lighttheme;
                              myThemeIcon = Icons.wb_sunny;
                              myThemeIconColor = Colors.yellow;
                            } else {
                              currentTheme = darktheme;
                              myThemeIcon = Icons.brightness_2;
                              myThemeIconColor = Colors.white;
                            }
                          });
                        },
                        child: Icon(
                          myThemeIcon,
                          color: myThemeIconColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ResponsiveWidget(
                            largeScreen: SizedBox(
                              height: 40.0,
                            ),
                            smallScreen: SizedBox(
                              height: 20.0,
                            ),
                          ),
                          Text(
                            "Heyyyy! I am Pallav",
                            style: GoogleFonts.aBeeZee(
                              fontSize:
                                  isLargeScreen(context) == true ? 50 : 27,
                              color: currentTheme.focusColor,
                              fontWeight: FontWeight.w300,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 40.0),
                            child: Text(
                              "Developing quality Native Android and Cross platform apps ",
                              style: TextStyle(
                                  fontSize: isLargeScreen(context) == true
                                      ? 60.0
                                      : 30,
                                  color: currentTheme.focusColor,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Texturina'),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          TypewriterAnimatedTextKit(
                            text: [
                              "I am App Developer",
                              "I specialize in Android",
                              "Engineer by Passion",
                              "Programmer by profession",
                            ],
                            speed: Duration(milliseconds: 250),
                            textStyle: GoogleFonts.aBeeZee(
                                fontSize:
                                    isLargeScreen(context) == true ? 58.0 : 23,
                                color: currentTheme.focusColor),
                          ),
                          ResponsiveWidget(
                            largeScreen: SizedBox(
                              height: 20.0,
                            ),
                            smallScreen: SizedBox(
                              height: 20.0,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              launch(
                                  "mailto:pallavc34@gmail.com?subject=Get a Quote&body=");
                            },
                            child: Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25.0)),
                              elevation: 25,
                              color: Colors.purple.shade300,
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Text(
                                  "Get in touch",
                                ),
                              ),
                            ),
                          ),
                          ResponsiveWidget(
                            largeScreen: SizedBox(
                              height: 40,
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
                    SizedBox(
                      height: isSmallScreen(context) == true ? 10.0 : 0.0,
                    ),
                    Text(
                      "Services",
                      style: GoogleFonts.averageSans(
                          fontSize: isLargeScreen(context) == true ? 50 : 30,
                          fontWeight: FontWeight.w400,
                          color: currentTheme.focusColor),
                    ),
                    ResponsiveWidget(
                      largeScreen: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              CardWidget(
                                title: "Android Developer(Native)",
                                subtitle: "Developing Android apps has always been\na passion. Can develop apps on Native Android\n"
                                    "as well as Google's Flutter UI framework\n which is popular for beautiful designs.",
                                iconData: Icons.android,
                                iconColor: Colors.green,
                                themeData: myThemeIcon,
                              ),
                              CardWidget(
                                title: "iOS Developer(Flutter)",
                                subtitle: "Developing Android apps has always been\na passion. Can develop apps on Native Android\n"
                                    "as well as Google's Flutter UI framework\n which is popular for beautiful designs.",
                                iconData: Icons.code_rounded,
                                iconColor: Colors.grey,
                                themeData: myThemeIcon,
                              ),
                              CardWidget(
                                title: "Web Developer(Flutter)",
                                subtitle: "Developing Android apps has always been\na passion. Can develop apps on Native Android\n"
                                    "as well as Google's Flutter UI framework\n which is popular for beautiful designs.",
                                iconData: Icons.web,
                                iconColor: Colors.grey,
                                themeData: myThemeIcon,
                              ),
                            ],
                          ),
                        ),
                      ),
                      smallScreen: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          children: [
                            CardWidget(
                              title: "Android Developer(Native)",
                              subtitle: "Developing Android apps has always been\na passion. Can develop apps on Native Android\n"
                                  "as well as Google's Flutter UI framework\nwhich is popular for beautiful designs.",
                              iconData: Icons.android,
                              iconColor: Colors.green,
                              themeData: myThemeIcon,
                            ),
                            CardWidget(
                              title: "iOS Developer(Flutter)",
                              subtitle: "Developing Android apps has always been\na passion. Can develop apps on Native Android\n"
                                  "as well as Google's Flutter UI framework\nwhich is popular for beautiful designs.",
                              iconData: Icons.code_rounded,
                              iconColor: Colors.grey,
                              themeData: myThemeIcon,
                            ),
                            CardWidget(
                              title: "Web Developer(Flutter)",
                              subtitle: "Developing Android apps has always been\na passion. Can develop apps on Native Android\n"
                                  "as well as Google's Flutter UI framework\nwhich is popular for beautiful designs.",
                              iconData: Icons.web,
                              iconColor: Colors.grey,
                              themeData: myThemeIcon,
                            ),
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
