import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
  static const String id = 'home_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Icon(Icons.verified_user),
                  Column(
                    children: [
                      Text(
                        "Pallav Chaudhari",
                        style: GoogleFonts.averageSans(fontSize: 25.0),
                      ),
                      Text(
                        "Creating the change",
                        style: GoogleFonts.aBeeZee(fontSize: 20.0),
                      )
                    ],
                  ),
                  SizedBox(width: 25.0,),
                  Container(
                    width: 20.0,
                    height: 20.0,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(25.0)
                    ),
                    child: Text("My Work",style: TextStyle(
                      fontSize: 15.0,
                      color: Colors.white
                    ),),
                  ),
                  SizedBox(width: 5.0,),
                  Text("About Me",style: TextStyle(
                    fontSize: 15.0
                  ),),
                  SizedBox(width: 5.0,),
                  Text("Contact Me",style: TextStyle(
                    fontSize: 15.0
                  ),),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
