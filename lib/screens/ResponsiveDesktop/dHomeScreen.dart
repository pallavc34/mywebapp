import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mywebapp/widgets/AppBarWidget.dart';
import 'package:mywebapp/widgets/MaterialAppWidget.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../Provider/ThemeProvider.dart';
import '../../constants.dart';
import '../../widgets/BoldTitleTextWidget.dart';
import '../../widgets/TechWidget.dart';

class dHomeScreen extends StatefulWidget {
  static const String id = "dhome_screen";

  @override
  _dHomeScreenState createState() => _dHomeScreenState();
}

class _dHomeScreenState extends State<dHomeScreen>
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
              preferredSize: const Size.fromHeight(50), child: AppBarWidget()),
          body: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Container(
              color: themeValue.getCurrentTheme.colorScheme.surface,
              child: Column(
                children: [
                  SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child: Container(
                              width: 300,
                              height: 300,
                              child: Image.asset(
                                "images/myself.jpg",
                                fit: BoxFit.fitHeight,
                              )),
                        ),
                        SizedBox(
                          width: 20.0,
                        ),
                        Column(
                          children: [
                            Text(
                              "Hey! I am Pallav",
                              style: GoogleFonts.aBeeZee(
                                fontSize: 25,
                                color: themeValue.getCurrentTheme.focusColor,
                                fontWeight: FontWeight.w300,
                              ),
                              textAlign: TextAlign.center,
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
                            LimitedBox(
                              maxWidth: size.width / 2 - 100,
                              child: Text(
                                MyConstants.introduction,
                                style: GoogleFonts.montserrat(
                                  fontSize: 20,
                                  color: themeValue.getCurrentTheme.focusColor,
                                ),
                                textAlign: TextAlign.center,
                                maxLines: 15,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    child: Column(
                      children: [
                        BoldTitleTextWidget(
                          currentTheme: themeValue.getCurrentTheme,
                          text: "Technology Stack",
                        ),
                        SizedBox(
                          height: 10,
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
                            SizedBox(
                              width: 20.0,
                            ),
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
                            SizedBox(
                              width: 20.0,
                            ),
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
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Center(
                    child: BoldTitleTextWidget(
                      currentTheme: themeValue.getCurrentTheme,
                      text: "My Apps",
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
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
                        width: 10.0,
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
                        width: 10.0,
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
                      text: "My blog",
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MaterialAppWidget(
                          text:
                              "How to add firebase authentication in android app",
                          subtext:
                              "Well, if minimal is what you like best then it is for you. Without much ado let's start to add Firebase authentication to your app.",
                          image: "images/blog1.jpeg",
                          url:
                              'https://androidinmyblood.blogspot.com/2019/08/how-to-add-firebase-authentication-in.html',
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        MaterialAppWidget(
                          text:
                              "Which is best language for Mobile app developer?",
                          subtext:
                              "As of now, approx 100 million people use Android devices. So, Here is the best language for mobile app development.",
                          image: "images/blog2.png",
                          url:
                              'https://androidinmyblood.blogspot.com/2019/01/which-programming-language-is-best-for.html',
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        MaterialAppWidget(
                          text:
                              "Why flutter is best for cross platform app development?",
                          subtext:
                              "Flutter is Google's cross-platform development SDK which uses one code base for both Android as well as iOS applications",
                          image: "images/blog3.png",
                          url:
                              'https://androidinmyblood.blogspot.com/2020/02/flutter-tutorial-introduction-to-flutter.html',
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        MaterialAppWidget(
                          text:
                          "Work Manager, the new Advanced Alarm Manager | Supports API 14+ | Works even in Doze Mode",
                          subtext:
                          "Since Android Oreo and above, Google has introduced doze mode which suspends almost all the Alarm Manager requests",
                          image: "images/blog4.png",
                          url:
                          'https://androidinmyblood.blogspot.com/2020/09/work-manager-new-advanced-alarm-manager.html',
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        MaterialAppWidget(
                          text:
                          "How to add Google Speech to Text to your android app",
                          subtext:
                          "Nowadays, each and every app on the Playstore uses voice search from Google. Well, because it is much easier to just speak",
                          image: "images/blog5.png",
                          url:
                          'https://androidinmyblood.blogspot.com/2019/09/how-to-add-google-speech-to-text-to.html',
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        GestureDetector(
                          onTap: () {
                            launch(
                                "https://androidinmyblood.blospot.com");
                          },
                          child: Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                              color: MyConstants.accentColor,
                            ),
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: FaIcon(
                                  FontAwesomeIcons.arrowRight,
                                  color:
                                      themeValue.getCurrentTheme.focusColor,
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  //Footer
                  SizedBox(
                    height: 20.0,
                  ),
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
                                "Designed and Developed with ❤️ by Pallav Chaudhari in ",
                                style: TextStyle(
                                    color:
                                        themeValue.getCurrentTheme.focusColor),
                              ),
                              GestureDetector(
                                onTap: () {
                                  launch("https://www.flutter.dev");
                                },
                                child: Text(
                                  "Flutter.",
                                  style: TextStyle(color: Colors.blue),
                                ),
                              ),
                            ],
                          ),
                          Text(
                            "Copyright @ 2020 - 2022",
                            style: TextStyle(
                                color: themeValue.getCurrentTheme.focusColor),
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
    //dispose class
    _animationController.dispose();
    super.dispose();
  }
}
