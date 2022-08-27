import 'package:flutter/material.dart';
import 'package:mywebapp/constants.dart';
import 'package:mywebapp/responsive_widget.dart';
import 'package:mywebapp/screens/HomeScreen.dart';
import 'package:mywebapp/screens/ResponsiveDesktop/dHomeScreen.dart';
import 'package:mywebapp/screens/ResponsiveDesktop/dMyAppDescription.dart';
import 'package:mywebapp/screens/ResponsiveMobile/mHomeScreen.dart';
import 'package:provider/provider.dart';

import 'Provider/ThemeProvider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ThemeProvider(),
          lazy: false,
        ),
      ],
      child: MaterialApp(
        theme: ThemeProvider().getDarkTheme(),
        debugShowCheckedModeBanner: false,
        initialRoute: HomeScreen.id,
        routes: {
          HomeScreen.id: (context) => HomeScreen(),
          mHomeScreen.id: (context) => mHomeScreen(),
          dHomeScreen.id: (context) => dHomeScreen(),
          dMyAppDescription.id: (context) => dMyAppDescription(),
        },
      ),
    );
  }
}
