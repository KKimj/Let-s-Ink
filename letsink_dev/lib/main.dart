import 'package:flutter/material.dart';

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
        //'/home' : (context) => HomePage(),
      },
      //theme: _letsTheme,
      //home: MyHomePage(title: 'Lets link project'),
    );
  }
}


// TODO 0 make software architecture
// TODO 1 implementation Theme class
// TODO 2 make assets directory
// TODO 3 change app icon
// TODO 4 implementation with Firebase ( e.g., Firestore, Dynamic links, auth )