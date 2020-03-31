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
