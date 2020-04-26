import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:letsinkdev/item/homeCard.dart';
import 'package:letsinkdev/model/imageSwiper.dart';
import 'package:letsinkdev/writePage.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import 'model/authProvider.dart';
import 'model/listViewHomeCard.dart';

class MainPage extends StatefulWidget {

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final ImageList = ['https://childrens.advil.com/sites/default/files/children-slide-11.jpg', 'https://www.newstap.co.kr/news/photo/201901/82107_133090_1856.jpg'];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Firestore.instance.collection('test_swiper').snapshots().listen((event) {
      event.documents.forEach((element) {print(element["image"]);});
    });

  }

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Let's Ink", style: TextStyle(fontWeight: FontWeight.normal),
        ),
      ),
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            DrawerHeader(child: Column(
              children: <Widget>[
                CircleAvatar(backgroundImage: NetworkImage(authProvider.user.photoUrl),),
                Text(authProvider.user.displayName),
              ],
            )),
            RaisedButton(
              child: Text('Log Out'),
              onPressed: ()
              {
//                authProvider.signOut();
//                    FirebaseAuth.instance.signOut();
//                    _googleSignIn.signOut();
              },
            ),
          ],
        ),
      ),
      body:
            Column(
            children: <Widget>[
              //ImageSwiper(),
              ListViewHomeCard(),
            ]),
      floatingActionButton: FloatingActionButton(child: Icon(Icons.add_circle),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context)=> WritePage()));
        },
      ),
    );
  }
}
