import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:letsinkdev/item/homeCard.dart';
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
  final ImageList = ['https://childrens.advil.com/sites/default/files/children-slide-11.jpg', 'https://www.newstap.co.kr/news/photo/201901/82107_133090_1856.jpg'];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var _snapshot = Firestore.instance.collection('test_swiper').snapshots();

  }

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
            child: Column(
              children: <Widget>[
                DrawerHeader(child: Column(
                  children: <Widget>[
                    CircleAvatar(backgroundImage: NetworkImage(widget.user.photoUrl),),
                    Text(widget.user.displayName),
                    Text(widget.user.phoneNumber),
                  ],
                )),
                RaisedButton(
                  child: Text('Log Out'),
                  onPressed: ()
                  {
                    FirebaseAuth.instance.signOut();
                    _googleSignIn.signOut();
                  },
                ),
              ],
            ),
          ),
          body: Column(
            children: <Widget>[

              Expanded(
                child: StreamBuilder(
                  stream: Firestore.instance.collection('test_items').snapshots(),

                  builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                    if(!snapshot.hasData)
                      {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    else {
                      var items = snapshot.data.documents ?? [];
                      return ListView.builder(
                          //physics: NeverScrollableScrollPhysics(),
                          itemCount: items.length+1,
                          itemBuilder: (BuildContext context, int index)
                          {
                            if(index == 0)
                              {
                                return StreamBuilder(
                                    stream: Firestore.instance.collection('test_swiper').snapshots(),
                                    builder: (context, snapshot) {
                                      if(!snapshot.hasData)
                                      {
                                        return Container(
                                          height: 250,
                                          child: Center(child: CircularProgressIndicator(),),
                                        );
                                      }
                                      var images = snapshot.data.documents ?? [];
                                      return Container(
                                        height: 250,
                                        child: new Swiper(
                                          itemBuilder: (BuildContext context, int index) {
                                            return new Image.network(
                                              (images[index])['image'],
                                              fit: BoxFit.fill,
                                            );
                                          },
                                          itemCount: images.length,
                                          viewportFraction: 0.8,
                                          scale: 0.9,
                                        ),
                                      );
                                    }
                                );
                              }
                            else {
                              return HomeCard(context, items[index-1]);
                            }
                          }
                      );
                    }
                  },

                ),
              ),
            ],
          ),
          floatingActionButton: FloatingActionButton(child: Icon(Icons.add_circle),
            onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=>WritePage(widget.user)));
            },
          ),
        ),
      ),
    );
  }
}
