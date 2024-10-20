import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mywebapp/widgets/AppBarWidget.dart';
import 'package:mywebapp/widgets/TechWidget.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../Provider/ThemeProvider.dart';
import '../../constants.dart';
import '../../widgets/BoldTitleTextWidget.dart';
import '../../widgets/MaterialAppWidget.dart';

class mHomeScreen extends StatefulWidget {
  static const String id = "mhome_screen";

  @override
  _mHomeScreenState createState() => _mHomeScreenState();
}

class _mHomeScreenState extends State<mHomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation _animation;

  @override
  void initState() {
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
    return Consumer<ThemeProvider>(
      builder: (BuildContext context, themeValue, Widget? child) {
        return Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(55),
            child: AppBarWidget(),
          ),
          body: SingleChildScrollView(
            physics: ClampingScrollPhysics(),
            child: Container(
              color: themeValue.getCurrentTheme.colorScheme.surface,
              child: Column(
                children: [
                  Container(
                    child: Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(25.0),
                                child: Container(
                                    width: 200,
                                    height: 200,
                                    child: Image.asset(
                                      "images/myself.jpg",
                                      fit: BoxFit.fitHeight,
                                    )),
                              ),
                              SizedBox(
                                height: 20.0,
                              ),
                              AnimatedTextKit(animatedTexts: [
                                TypewriterAnimatedText(
                                  "Hey! I am Pallav",
                                  speed: Duration(milliseconds: 200),
                                  textStyle: GoogleFonts.aBeeZee(
                                    fontSize: 25,
                                    color:
                                        themeValue.getCurrentTheme.focusColor,
                                    fontWeight: FontWeight.w300,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ]),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                "Innovative | Relentless | Ambitious ",
                                style: GoogleFonts.aBeeZee(
                                  fontSize: 22,
                                  color: themeValue.getCurrentTheme.focusColor,
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
                                  MyConstants.introduction,
                                  style: GoogleFonts.montserrat(
                                    fontSize: 20,
                                    color:
                                        themeValue.getCurrentTheme.focusColor,
                                    //fontFamily: 'Texturina'
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              SizedBox(
                                height: 20.0,
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
                        BoldTitleTextWidget(
                          currentTheme: themeValue.getCurrentTheme,
                          text: "Technology Stack",
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TechWidget(
                                imageString: "images/tech1.webp",
                                launchURL: "https://struts.apache.org/",
                                appText: "Struts"),
                            SizedBox(
                              width: 20.0,
                            ),
                            TechWidget(
                                imageString: "images/tech2.png",
                                launchURL: "https://www.java.com/en/",
                                appText: "Java"),
                          ],
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TechWidget(
                                imageString: "images/tech3.png",
                                launchURL: "https://flutter.dev/",
                                appText: "Flutter"),
                            SizedBox(
                              width: 20.0,
                            ),
                            TechWidget(
                                imageString: "images/tech5.png",
                                launchURL:
                                    "https://developer.android.com/about/",
                                appText: "Android"),
                            SizedBox(
                              width: 20.0,
                            ),
                            TechWidget(
                                imageString: "images/tech4.png",
                                launchURL: "https://firebase.google.com/",
                                appText: "Firebase"),
                          ],
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TechWidget(
                                imageString: "images/tech6.jpeg",
                                launchURL: "https://www.sqlite.org/index.html",
                                appText: "SQLite"),
                            SizedBox(
                              width: 20.0,
                            ),
                            TechWidget(
                                imageString: "images/tech7.png",
                                launchURL: "https://www.w3schools.com/sql/",
                                appText: "SQL"),
                          ],
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: BoldTitleTextWidget(
                      currentTheme: themeValue.getCurrentTheme,
                      text: "My Apps",
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Column(
                    children: [
                      MaterialAppWidget(
                        text: "ISLT",
                        subtext:
                            "A sign language translator that aims to make communication with deaf people more easier",
                        image: "images/ISLT.jpg",
                        url:
                            'https://play.google.com/store/apps/details?id=com.andrdoc.signlanguage',
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      MaterialAppWidget(
                        text: "Personal Diary",
                        subtext:
                            "A diary which saves all your secrets, keeps track of all your moods and looks better than the most",
                        image: "images/diary.jpg",
                        url:
                            'https://play.google.com/store/apps/details?id=com.androidinmyblood.personaldairy',
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      MaterialAppWidget(
                        text: "StreakOMeter",
                        subtext:
                        "StreakOMeter is an app to integrate new positive habits into your lifestyle and eliminate negative habits. ",
                        image: "images/habits.png",
                        //TODO add habits url
                        url:
                        'https://play.google.com/store/apps/details?id=com.androidinmyblood.personaldairy',
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Center(
                    child: BoldTitleTextWidget(
                      currentTheme: themeValue.getCurrentTheme,
                      text: "My Blog",
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MaterialAppWidget(
                        text:
                            "How to add firebase authentication in android app",
                        subtext:
                            "Well, if minimal is what you like best then it is for you. Without much ado let's start to add Firebase authentication to your app.",
                        image: "images/blog1.jpeg",
                        url:
                            'https://blog.apdevc.com/2019/08/how-to-add-firebase-authentication-in.html',
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      MaterialAppWidget(
                        text:
                            "Which is best language for Mobile app developer?",
                        subtext:
                            "As of now, approx 100 million people use Android devices. So, Here is the best language for mobile app development.",
                        image: "images/blog2.png",
                        url:
                            'https://blog.apdevc.com/2019/01/which-programming-language-is-best-for.html',
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      MaterialAppWidget(
                        text:
                            "Why flutter is best for cross platform app development?",
                        subtext:
                            "Flutter is Google's cross-platform development SDK which uses one code base for both Android as well as iOS applications",
                        image: "images/blog3.png",
                        url:
                            'https://blog.apdevc.com/2020/02/flutter-tutorial-introduction-to-flutter.html',
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      GestureDetector(
                        onTap: () {
                          launch(
                              "https://blog.apdevc.com/search/label/Android%20Development");
                        },
                        child: Container(
                          width: 200,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            color: MyConstants.accentColor,
                          ),
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  FaIcon(
                                    FontAwesomeIcons.arrowRight,
                                    color:
                                        themeValue.getCurrentTheme.focusColor,
                                  ),
                                  SizedBox(
                                    width: 8.0,
                                  ),
                                  Text(
                                    "View all posts",
                                    style: TextStyle(
                                        color: themeValue
                                            .getCurrentTheme.focusColor),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  //Footer
                  Container(
                    color: MyConstants.accentColor,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                  onTap: () {
                                    launch(
                                        "https://www.linkedin.com/in/pallav-chaudhari-403a16122/");
                                  },
                                  child: FaIcon(FontAwesomeIcons.linkedin)),
                              SizedBox(
                                width: 7.0,
                              ),
                              GestureDetector(
                                  onTap: () {
                                    launch(
                                        "https://twitter.com/pallavchaudhary");
                                  },
                                  child: FaIcon(
                                    FontAwesomeIcons.twitter,
                                    color: Colors.lightBlue,
                                  )),
                              SizedBox(
                                width: 7.0,
                              ),
                              GestureDetector(
                                  onTap: () {
                                    launch(
                                        "https://www.instagram.com/chaudhari_pallav98/");
                                  },
                                  child: FaIcon(
                                    FontAwesomeIcons.instagram,
                                    color: Colors.pink.shade300,
                                  )),
                              SizedBox(
                                width: 7.0,
                              ),
                              GestureDetector(
                                  onTap: () {
                                    launch(
                                        "https://www.facebook.com/pallav.chaudhari");
                                  },
                                  child: FaIcon(
                                    FontAwesomeIcons.facebook,
                                    color: Colors.lightBlue,
                                  )),
                            ],
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Designed and Developed with ❤️ by Pallav Chaudhari",
                                style: TextStyle(color: Colors.black),
                                maxLines: 2,
                              ),
                            ],
                          ),
                          GestureDetector(
                            onTap: () {
                              launch("https://www.flutter.dev");
                            },
                            child: Text(
                              "Developed in Flutter.",
                              style: TextStyle(color: Colors.blue),
                            ),
                          ),
                          Text(
                            "Copyright @ 2020 - 2022",
                            style: TextStyle(color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    // implement dispose
    _animationController.dispose();
    super.dispose();
  }
}
