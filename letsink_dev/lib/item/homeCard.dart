import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';


Widget HomeCard(context, document) {
  return Container(
    key: UniqueKey(),
    height: 180,
    child: Card(
      semanticContainer: true,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Column(
        children: <Widget>[
          ListTile(
            leading: Image.network(
              document['thumbnail'], fit: BoxFit.fill,),
            title: Text(document['title']),
            subtitle: Column(
              children: <Widget>[
                Text(document['description']),
                Row(
                  children: <Widget>[
                    Text('필요한 개수 : '+ document['quantity']),
                    Padding(padding: EdgeInsets.all(10),),
                    Text(document['location']),
                    Padding(padding: EdgeInsets.all(10),),

                  ],
                ),
              ],
            ),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: () {
              print('item2');
            },
          ),
          Padding(padding: EdgeInsets.all(8)),
          Row(
            children: <Widget>[
              Padding(padding: EdgeInsets.all(10),),
              Text(document['owner']),
              Padding(padding: EdgeInsets.all(10),),
              Text("눌러서 전화하기"),
              FlatButton(
                child: Icon(Icons.call),
                onPressed: () => launch('tel://'+document['tel']),
              ),
            ],
          )
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