import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  static const String id = 'home_screen';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation _animation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animationController = AnimationController(
        vsync: this,
        duration: Duration(seconds: 10)
    );
    _animation = ColorTween(begin: Colors.red, end: Colors.lightBlue).animate(
        _animationController);
    _animationController.forward();
    _animationController.addListener(() {
      setState(() {

      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: _animation.value,
      body: Container(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: size.height * 0.4,),
              Text("Pallav Chaudhari",
                style: GoogleFonts.averageSans(
                    fontSize: 50.0,
                    color: Colors.deepPurple,
                  fontWeight: FontWeight.w600
                ),),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Creating the change with the applications I build",
                  style: GoogleFonts.averageSans(
                      fontSize: 45.0,
                      color: Colors.purple,
                    fontWeight: FontWeight.bold,
                  ),),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TypewriterAnimatedTextKit(
                  speed: Duration(milliseconds: 200),
                  text:["You will find me reading books,","when I am not busy coding different innovative apps.",
                      "Engineer by Profession,","Coder by Passion"],
                  textAlign: TextAlign.center,
                  textStyle: GoogleFonts.aBeeZee(
                      fontWeight: FontWeight.w400,
                    fontSize: 40.0
                  ),),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _animationController.dispose();
  }
}
