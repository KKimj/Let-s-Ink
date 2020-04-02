import 'package:flutter/material.dart';
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
      title: 'Lets link project',
      initialRoute: '/',
      routes: {
        //
        '/login': (context) => LoginPage(),
        '/home' : (context) => MainPage(),
      },
      //theme: _letsTheme,
      home: RootPage(),

    );
  }
}



// TODO 0 make software architecture
// TODO 1 implementation Theme class
// * Done TODO 2 make assets directory
// * Done TODO 3 change app icon
// TODO 4 implementation with Firebase ( e.g., Firestore, Dynamic links, auth )
// * Done TODO 5 implementation native splash screen
