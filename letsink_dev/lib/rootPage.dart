import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:letsinkdev/loginPage.dart';
import 'package:letsinkdev/mainPage.dart';
import 'dart:io' show Platform;

class RootPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Platform.isAndroid?
      StreamBuilder<FirebaseUser>(
      stream: FirebaseAuth.instance.onAuthStateChanged,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if(snapshot.hasData) {
          return MainPage(snapshot.data);
        }
        else {
          return LoginPage();
        }
      },
    ):
    (
        Platform.isIOS?
          Scaffold(
            body: Center(
              child: Text('ios'),
            ),
          )
        :
          Scaffold(
          body:
            Center(
              child: Text('web'),
          ),
        )
    );
  }
}
