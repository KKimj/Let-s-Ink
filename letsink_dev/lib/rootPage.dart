import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:letsinkdev/loginPage.dart';
import 'package:letsinkdev/mainPage.dart';
import 'package:provider/provider.dart';
import 'dart:io' show Platform;

import 'model/authProvider.dart';

class RootPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    print('rootPage');
    return LoginPage();
    /*
      StreamBuilder<FirebaseUser>(
      stream: FirebaseAuth.instance.onAuthStateChanged,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          print('mainpage.');
          return MainPage(snapshot.data);
        }
        else {
          print('loginpage.');
          {
            return LoginPage();
          }
        }
      },
    );


*/

  }
}
