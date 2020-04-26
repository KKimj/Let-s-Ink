import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:letsinkdev/mainPage.dart';
import 'package:provider/provider.dart';

import 'model/authProvider.dart';


class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  @override
  Widget build(BuildContext context) {

    AuthProvider authProvider = Provider.of<AuthProvider>(context);

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
              {
              authProvider.handleSignIn().then((user) {
                print(authProvider.user);
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>
                    MainPage()
                /*
                    ChangeNotifierProvider.value(
                        value: authProvider,
                        child: MainPage(),
                    ))

                 */
                ));
              });
              },
            ),
          ],
        ),
      ),
    );
  }
}
