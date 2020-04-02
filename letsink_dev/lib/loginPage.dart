import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';


class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Let's Ink Project", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 34),),
            Padding(padding: EdgeInsets.all(20),),
            Text("Google 계정으로 로그인", style: TextStyle(fontSize: 18),),
            SignInButton(
              Buttons.GoogleDark,
              onPressed: ()
              {},
            ),
          ],
        ),
      ),
    );
  }
}
