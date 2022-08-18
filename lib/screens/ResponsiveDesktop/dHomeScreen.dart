import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mywebapp/widgets/MaterialAppWidget.dart';

import '../../constants.dart';
import '../../responsive_widget.dart';
import '../../widgets/BoldTitleTextWidget.dart';
import '../../widgets/CardWidget.dart';
import '../../widgets/CarouselWidget.dart';

class dHomeScreen extends StatefulWidget {
  static const String id = "dhome_screen";

  @override
  _dHomeScreenState createState() => _dHomeScreenState();
}

class _dHomeScreenState extends State<dHomeScreen>
    with SingleTickerProviderStateMixin {
  IconData myThemeIcon = Icons.wb_sunny;
  Color myThemeIconColor = Colors.yellow;
  ThemeData currentTheme = MyConstants().getCurrentTheme(Icons.wb_sunny);
  late AnimationController _animationController;
  late Animation _animation;

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
                    Expanded(
                      child: Text(
                        "A Passionate Developers Creation",
                        style: GoogleFonts.averageSans(
                          fontSize: 30.0,
                          color: currentTheme.focusColor,
                        ),
                      ),
                    ),
                    Row(
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
                          ClipRRect(
                            borderRadius: BorderRadius.circular(100.0),
                            child: Container(
                                width: 200,
                                height: 200,
                                child: Image.asset(
                                  "images/myself.jpg",
                                  fit: BoxFit.fitWidth,
                                )),
                          ),
                          SizedBox(
                              height: 40.0,
                            ),
                          Text(
                            "Hey! I am Pallav",
                            style: GoogleFonts.aBeeZee(
                              fontSize: 25,
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
                              MyConstants.introduction,
                              style: GoogleFonts.montserrat(
                                fontSize: 20,
                                color: currentTheme.focusColor,
                                //fontFamily: 'Texturina'
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          /*TypewriterAnimatedTextKit(
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
                          ),*/
                           SizedBox(
                              height: 20.0,
                            ),

                          /*GestureDetector(
                            onTap: () {
                              launch(
                                  "https://www.fiverr.com/share/71ezPb");
                            },
                            child: Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25.0)),
                              elevation: 25,
                              color: Colors.purple.shade300,
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Text(
                                  "Order a project",
                                ),
                              ),
                            ),
                          ),*/
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
                      currentTheme: currentTheme,
                      text: "I am",
                    ),
                    Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              Container(
                                width: 350,
                                height: 250,
                                child: Center(
                                  child: CardWidget(
                                    title: "Java Developer",
                                    subtitle: "I am experienced in designing, developing and debugging frontend user interfaces in Ja" +
                                        "va in Banking domain. Worked in TCS BANCS in banking products. Tools used include " +
                                        "Eclipse, Tomcat Server, SQL Developer",
                                    iconData: FontAwesomeIcons.java,
                                    iconColor: Colors.red,
                                    themeData: myThemeIcon,
                                  ),
                                ),
                              ),
                              Center(
                                child: Container(
                                  width: 350,
                                  height: 250,
                                  child: CardWidget(
                                    title: "Native Android Developer",
                                    subtitle:
                                        "Developing Android apps has always been a passion. I develop apps in Native Android "
                                        "as well as Google's Flutter UI framework which is popular for beautiful designs.",
                                    iconData: FontAwesomeIcons.android,
                                    iconColor: Colors.green,
                                    themeData: myThemeIcon,
                                  ),
                                ),
                              ),
                              Center(
                                child: Container(
                                  width: 350,
                                  height: 250,
                                  child: CardWidget(
                                    title: "Flutter Developer",
                                    subtitle:
                                        "Cross platform apps that look and feel native. I develop cross platform apps in Flutter framework "
                                        "which is popular for beautiful designs with skia, its own graphic engine.",
                                    iconData: FontAwesomeIcons.appStoreIos,
                                    iconColor: Colors.blue,
                                    themeData: myThemeIcon,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                  ],
                ),
              ),
              Center(
                child: BoldTitleTextWidget(
                  currentTheme: currentTheme,
                  text: "My Creations",
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MaterialAppWidget(text: "ISLT", subtext: "A sign language translator that aims to make communication with deaf people more easier", image: "images/ISLT.jpg", url: Uri(scheme: 'https', host: 'play.google.com', path: 'headers/'),),
                  MaterialAppWidget(text: "Personal Diary", subtext: "A diary which saves all your secrets, keeps track of all your moods and looks better than the most", image: "images/diary.jpg", url: Uri(scheme: 'https', host: 'play.google.com', path: 'headers/'),),
                ],
              ),
              //Footer
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  "Designed and Developed by Pallav Chaudhari in Flutter. Copyright @ 2020 - 2022",
                  style: TextStyle(color: currentTheme.focusColor),
                ),
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

  @override
  void dispose() {
    // TODO: implement dispose
    _animationController.dispose();
    super.dispose();
  }
}
