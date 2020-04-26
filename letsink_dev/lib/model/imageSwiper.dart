import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class ImageSwiper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: StreamBuilder(
          stream: Firestore.instance.collection('test_swiper').snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Container(
                height: 250,
                child: Center(child: CircularProgressIndicator(),),
              );
            }
            else {
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
          }
        ),
    );
  }
}
