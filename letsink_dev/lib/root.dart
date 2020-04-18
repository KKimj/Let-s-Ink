import 'package:flutter/material.dart';
import 'dart:io' show Platform;

import 'package:letsinkdev/rootPage.dart';

class Root extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    if (Platform.isAndroid) {
      return RootPage();
    }
    else if (Platform.isIOS) {
      print('ios');
      //return RootPage();
      return Scaffold(
        appBar: AppBar(title: Text('ios screen'),),
        body:
        Center(
          child: Column(
            children: <Widget>[
              Text('ios'),
              Image.network('https://lh6.googleusercontent.com/-mwjksp6bc3c/Uedd3ROtyZI/AAAAAAAAAJM/9jQ_qfCEshQ/s1600/NEW+GOOGLE+LOGO.jpg'),
              Image.network('https://lh6.googleusercontent.com/-mwjksp6bc3c/Uedd3ROtyZI/AAAAAAAAAJM/9jQ_qfCEshQ/s1600/NEW+GOOGLE+LOGO.jpg'),
            ],
          ),
        ),
      );
    }
    else {
      return Scaffold(
        appBar: AppBar(title: Text('web screen'),),
        body:
        Center(
          child: Text('web'),
        ),
      );
    }
  }
}

