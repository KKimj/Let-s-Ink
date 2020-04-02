import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:letsinkdev/loginPage.dart';
import 'package:letsinkdev/mainPage.dart';
import 'package:letsinkdev/rootPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      title: 'Lets ink project',
      initialRoute: '/',
      routes: {
        //
        '/login': (context) => LoginPage(),
        '/home' : (context) => MainPage(),
      },
      theme: ThemeData(
        accentColor: const Color(0xFFF16876),
        primaryColor: const Color(0xFFB3BFE7),
        fontFamily: 'Avenir',
        /*textTheme: TextTheme(
          title: TextStyle(fontSize: 18.0, fontStyle: FontStyle.normal),
          body1: TextStyle(fontSize: 14.0, fontStyle: FontStyle.normal)
        )*/

      ),
      home: RootPage(),

    );
  }
}



// TODO 0 make software architecture
// * Done TODO 1 implementation Theme class
// * Done TODO 2 make assets directory
// * Done TODO 3 change app icon
// TODO 4 implementation with Firebase ( e.g., Firestore, Dynamic links, auth )
// * Done TODO 4-1 implementation LoginPage UI
// TODO 4-2 implementation Firebase auth
// TODO 4-3 abstract Firestore interface
// TODO 4-3 make Database document architecture
// * Done TODO 5 implementation native splash screen
// TODO 6 implementation Write Page
// TODO 7 implementation MainPage
