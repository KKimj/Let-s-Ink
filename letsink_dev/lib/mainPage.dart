import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:letsinkdev/writePage.dart';
import 'package:url_launcher/url_launcher.dart';

class MainPage extends StatefulWidget {
  final FirebaseUser user;
  MainPage(this.user);
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFB3BFE7),
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text("Let's Ink", style: TextStyle(fontWeight: FontWeight.normal),
            ),
          ),
          drawer: Drawer(
            child: Center(
              child: RaisedButton(
                child: Text('Log Out'),
                onPressed: ()
                {
                  FirebaseAuth.instance.signOut();
                  _googleSignIn.signOut();
                },
              ),
            ),
          ),
          body: Column(
            children: <Widget>[
              Container(
                height: 250,
                child: new Swiper(
                  itemBuilder: (BuildContext context, int index) {
                    return new Image.network(
                      "https://childrens.advil.com/sites/default/files/children-slide-11.jpg",
                      fit: BoxFit.fill,
                    );
                  },
                  itemCount: 3,
                  viewportFraction: 0.8,
                  scale: 0.9,
                ),
              ),
              Expanded(
                child: ListView.builder(
                    itemCount: 3,
                    itemBuilder: (BuildContext context, int index)
                    {
                      return HomeCard();
                    }
                ),
              ),
            ],
          ),
          floatingActionButton: FloatingActionButton(child: Icon(Icons.add_circle),
            onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=>WritePage()));
            },
          ),
        ),
      ),
    );
  }
}

/*
Container(
            height: 250,
            child: new Swiper(
              itemBuilder: (BuildContext context, int index) {
                return new Image.network(
                  "https://childrens.advil.com/sites/default/files/children-slide-11.jpg",
                  fit: BoxFit.fill,
                );
              },
              itemCount: 3,
              viewportFraction: 0.8,
              scale: 0.9,
            ),
          ),
          HomeCard(),
 */

class HomeCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      child: Card(
        semanticContainer: true,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Column(
          children: <Widget>[
            ListTile(
              leading: Image.network(
                'https://placeimg.com/640/480/any', fit: BoxFit.fill,),
              title: Text('도서1_1'),
              subtitle: Text('도와주세요!1'),
              trailing: Icon(Icons.keyboard_arrow_right),
              onTap: () {
                print('item2');
              },
            ),

            Row(
              children: <Widget>[
                Padding(padding: EdgeInsets.all(10),),
                Text("눌러서 전화하기"),
                FlatButton(
                  child: Icon(Icons.call),
                  onPressed: () => launch("tel://01073313920"),
                ),
                Text("인천 서구"),
              ],
            ),
          ],
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        elevation: 2,
        margin: EdgeInsets.all(10),
      ),
    );
  }
}
