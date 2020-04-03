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
        '/home' : (context) => MainPage(null),
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



// * Postpone TODO 0 make software architecture
// * Done TODO 1 implementation Theme class
// * Done TODO 2 make assets directory
// * Done TODO 3 change app icon
// TODO 4 implementation with Firebase ( e.g., Firestore, Dynamic links, auth )
// * Done TODO 4-1 implementation LoginPage UI
// * Done TODO 4-2 implementation Firebase auth
// * Done TODO 4-2-0 implementation login Function
// * Postpone TODO 4-2-1 implementation with provider pattern state management
// * Done TODO 4-3 abstract Firestore interface
// * Done TODO 4-3 make Database document architecture
// * Done TODO 4-3-0 make collection
// * Postpone TODO 4-3-1 implementation item class provider
// TODO 4-4 implementation Dynamic link
// * Done TODO 5 implementation native splash screen
// * Done TODO 6 implementation Write Page
// * Done TODO 7 implementation MainPage
// * Done TODO 7-1 implementation ListView
// * Done TODO 7-1-1 implementation ListView.Builer
// * Postpone TODO 7-1-2 modify ListView Scroll
// * Done TODO 7-2 implementation Card
// * Done TODO 7-2-1 implementation call by number
// * Done TODO 7-2-2 Add Swiper
// * Done TODO 7-2-3 sync Swiper Image with FireStore
// * Done TODO 8 implementation Call by number
// * Done TODO 9 use SafeArea Widget