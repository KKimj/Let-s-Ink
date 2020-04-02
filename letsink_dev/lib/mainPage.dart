import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:url_launcher/url_launcher.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Let's Ink", style: TextStyle(fontWeight: FontWeight.normal),
        ),
      ),
      drawer: Drawer(),
      body: Container(
        child: ListView(
          children: <Widget>[
            Swiper(
                itemBuilder: (BuildContext context,int index){
                  return new Image.network("http://via.placeholder.com/350x150",fit: BoxFit.fill,);
                },
                itemCount: 3,
                pagination: new SwiperPagination(),
                control: new SwiperControl()
            ),
            Container(
              height: 150,
              child: Card(
                semanticContainer: true,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: Column(
                  children: <Widget>[
                    ListTile(
                      leading: Image.network(
                        'https://placeimg.com/640/480/any', fit: BoxFit.fill,),
                      title: Text('도서1'),
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
                      ],
                    ),
                  ],
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                elevation: 5,
                margin: EdgeInsets.all(10),
              ),
            ),
            Container(
              height: 150,
              child: Card(
                semanticContainer: true,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: ListTile(
                  leading: Image.network(
                    'https://placeimg.com/640/480/any', fit: BoxFit.fill,),
                  title: Text('도서2'),
                  subtitle: Text('도와주세요!2'),
                  trailing: Icon(Icons.keyboard_arrow_right),
                  onTap: () {
                    print('item2');
                  },
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                elevation: 5,
                margin: EdgeInsets.all(10),
              ),
            ),
            Container(
              height: 150,
              child: Card(
                semanticContainer: true,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: ListTile(
                  leading: Image.network(
                    'https://placeimg.com/640/480/any', fit: BoxFit.fill,),
                  title: Text('도서3'),
                  subtitle: Text('도와주세요!3'),
                  trailing: Icon(Icons.keyboard_arrow_right),
                  onTap: () {
                    print('item2');
                  },
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                elevation: 5,
                margin: EdgeInsets.all(10),
              ),
            ),
          ],
        )
      ),
      floatingActionButton: FloatingActionButton(child: Icon(Icons.add_circle),
        onPressed: () {},
      ),
    );
  }
}

