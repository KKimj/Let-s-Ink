import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:letsinkdev/loginPage.dart';
import 'package:letsinkdev/mainPage.dart';

class RootPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<FirebaseUser>(
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if(snapshot.hasData) {
          return MainPage();
        }
        else {
          return MainPage();
        }
      },
    );
  }
}
