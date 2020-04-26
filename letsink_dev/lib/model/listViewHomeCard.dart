import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:letsinkdev/item/homeCard.dart';
import 'package:letsinkdev/model/imageSwiper.dart';

class ListViewHomeCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: StreamBuilder(
        stream: Firestore.instance.collection('test_items').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if(!snapshot.hasData)
            {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          else
            {
              var items = snapshot.data.documents ?? [];
              return ListView.builder(
                //physics: NeverScrollableScrollPhysics(),
                itemCount: items.length+1,
                itemBuilder: (BuildContext context, int index)
                  {
                    if(index == 0) return ImageSwiper();
                    return HomeCard(context, items[index-1]);
                  }
              );
            }
        }
      )
    );
  }
}
