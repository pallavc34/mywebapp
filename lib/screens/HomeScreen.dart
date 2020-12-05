import 'dart:math';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
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
  ThemeData currentTheme = MyConstants().getCurrentTheme(Icons.wb_sunny);
  AnimationController _animationController;
  Animation _animation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
    _animationController.addListener(() {
      setState(() {});
    });
    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOutBack,
    );
    _animationController.forward();
    _animationController.addStatusListener((status) {
      setState(() {
        if (status == AnimationStatus.completed) {
          _animationController.reverse();
        } else if (status == AnimationStatus.dismissed) {
          _animationController.forward();
        }
      });
    });
  }

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
                            buildNightMode()
                          ],
                        ),
                        smallScreen: buildNightMode()),
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
                            "Hey! I am Pallav",
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
                              "Engineer by Profession",
                              "Programmer by passion",
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
                    BoldTitleTextWidget(currentTheme: currentTheme,text: "Services",),
                    ResponsiveWidget(
                      largeScreen: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              CardWidget(
                                title: "Android Developer(Native)",
                                subtitle:
                                    "Developing Android apps has always been\na passion. I develop apps in Native Android\n"
                                    "as well as Google's Flutter UI framework\n which is popular for beautiful designs.",
                                iconData: Icons.android,
                                iconColor: Colors.green,
                                themeData: myThemeIcon,
                              ),
                              CardWidget(
                                title: "iOS Developer(Flutter)",
                                subtitle:
                                    "Cross platform apps that look and feel\nnative. I develop iOS apps in Flutter framework\n"
                                    "which is popular for beautiful designs\nwith skia, its own graphic engine.",
                                iconData: Icons.code_rounded,
                                iconColor: Colors.grey,
                                themeData: myThemeIcon,
                              ),
                              CardWidget(
                                title: "Web Developer(Flutter)",
                                subtitle:
                                    "Web development made easy with flutter\nEven web apps are now easy to build with\n"
                                    "flutter and its strong cross platform\n compatibilities.",
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
                              subtitle:
                                  "Developing Android apps has always been\na passion. Can develop apps on Native Android\n"
                                  "as well as Google's Flutter UI framework\nwhich is popular for beautiful designs.",
                              iconData: Icons.android,
                              iconColor: Colors.green,
                              themeData: myThemeIcon,
                            ),
                            CardWidget(
                              title: "iOS Developer(Flutter)",
                              subtitle:
                                  "Cross platform apps that look and feel\nnative. I develop iOS apps in Flutter framework\n"
                                  "which is popular for beautiful designs\nwith skia, its own graphic engine.",
                              iconData: Icons.code_rounded,
                              iconColor: Colors.grey,
                              themeData: myThemeIcon,
                            ),
                            CardWidget(
                              title: "Web Developer(Flutter)",
                              subtitle:
                                  "Web development made easy with flutter\nEven web apps are now easy to build with\n"
                                  "flutter and its strong cross platform\ncompatibilities.",
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
              //TODO MyWork
              Center(
                child: BoldTitleTextWidget(
                  currentTheme: currentTheme,
                  text: "My Work",
                ),
              ),
              ResponsiveWidget(
                largeScreen: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            "Personal Diary",
                            style: GoogleFonts.comfortaa(
                                fontSize: 40.0,
                                fontWeight: FontWeight.w400,
                                color: currentTheme.focusColor),
                            textAlign: TextAlign.start,
                          ),
                          Text(
                              "A diary which saves all your secrets, keeps track \nof all your moods and looks better than the most",
                              style: GoogleFonts.comfortaa(
                                  color: currentTheme.focusColor,
                                  fontSize: 30.0,
                                  fontWeight: FontWeight.w400),
                              textAlign: TextAlign.start)
                        ],
                      ),
                      Transform.rotate(
                        angle: 0.3,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(25.0),
                          child: Container(
                              height: size.height * 0.75,
                              child: Image.asset("images/diary.jpeg")),
                        ),
                      ),
                    ],
                  ),
                ),
                smallScreen: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Card(
                    elevation: 15.0,
                    color: currentTheme.backgroundColor,
                    shadowColor: myThemeIcon == Icons.wb_sunny ? Colors.black.withOpacity(0.5) : Colors.white.withOpacity(0.5),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      side: BorderSide(
                        color: myThemeIcon == Icons.wb_sunny ? Colors.black.withOpacity(0.7) : Colors.white.withOpacity(0.7),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Personal Diary",
                            style: GoogleFonts.aBeeZee(
                                fontSize: 20.0,
                                fontWeight: FontWeight.w400,
                                color: currentTheme.focusColor),
                            textAlign: TextAlign.start,
                          ),
                          Text(
                              "A diary which saves all your secrets, keeps track \nof all your moods and looks better than the most",
                              style: GoogleFonts.aBeeZee(
                                  color: currentTheme.focusColor,
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.w400),
                              textAlign: TextAlign.start),
                          CarouselSlider.builder(
                            itemCount: 3,
                            options: CarouselOptions(
                              enableInfiniteScroll: true,
                              autoPlay: true,
                              enlargeCenterPage: true,
                            ),
                            itemBuilder: (context, index){
                              var string = ['Beautiful UI','Expressive','Customizable'];
                              var diary = ['diary.jpeg','diary2.jpeg','diary3.jpeg'];
                              return Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  color: Color(0xFFd1c4e9),
                                ),
                                padding: EdgeInsets.all(10.0),
                                child: Column(
                                  children: [
                                    Text(string[index]),
                                    SizedBox(height: 5.0,),
                                    Expanded(
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(10.0),
                                        child: Container(
                                            height: 250,
                                            child: Image.asset("images/${diary[index]}")),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              //Footer
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                    "Designed and Developed by Pallav Chaudhari. Copyright @ 2020",
                style: TextStyle(
                  color: currentTheme.focusColor
                ),),
              )
            ],
          ),
        ),
      ),
    );
  }

  GestureDetector buildNightMode() {
    return GestureDetector(
      onTap: () {
        setState(() {
          if (myThemeIcon == Icons.brightness_2) {
            currentTheme = MyConstants().getlightTheme();
            myThemeIcon = Icons.wb_sunny;
            myThemeIconColor = Colors.yellow;
          } else {
            currentTheme = MyConstants().getdarkTheme();
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
    );
  }
}

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
