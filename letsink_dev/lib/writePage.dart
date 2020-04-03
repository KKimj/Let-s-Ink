import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class WritePage extends StatefulWidget {
  final FirebaseUser user;
  WritePage(this.user);
  @override
  _WritePageState createState() => _WritePageState();
}

class _WritePageState extends State<WritePage> {
  final textEditingController = <TextEditingController> [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(), // 제목
    TextEditingController(), // 설명

  ];

  File _image;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    textEditingController[0].dispose();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add_a_photo),
        onPressed: _getImage,
      ),
      appBar: AppBar(
        title: Text('게시글 작성'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.send),
            onPressed: () {
              final firebaseStorageRef = FirebaseStorage.instance
                  .ref()
                  .child('test_items')
                  .child('${DateTime.now().millisecondsSinceEpoch}${widget.user.email}');
              final task = firebaseStorageRef.putFile(
                  _image, StorageMetadata(contentType: 'image/png'));
              task.onComplete.then((value)
              {
                var downloadUrl = value.ref.getDownloadURL();
                downloadUrl.then((_url)
                {
                  var doc = Firestore.instance.collection('test_items').document();
                  doc.setData(
                    {
                      'id' : doc.documentID,
                      "timestamp" : Timestamp.now().millisecondsSinceEpoch,
                      "title" : textEditingController[5].text,
                      "description" : textEditingController[6].text,
                      "tel" : textEditingController[4].text,
                      "name" : textEditingController[1].text,
                      "quantity" : textEditingController[2].text,
                      "location" : textEditingController[3].text,
                      "owner" : textEditingController[0].text,
                      "thumbnail" : _url.toString(),
                      "images" : [
                        _url.toString()
                      ]
                    }
                  ).then((_value) {
                    Navigator.pop(context);
                  } );
                });
              });
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            _image == null ? Text('이미지 업로드 해주세요.') : Image.file(_image),
            Text('Write Page'),
            TextField(
              decoration: InputDecoration(hintText: '사용자 이름을 입력하세요.'),
              controller: textEditingController[0],
            ),
            TextField(
              decoration: InputDecoration(hintText: '필요한 물품을 바로 알수 있는 제목을 입력하세요.'),
              controller: textEditingController[5],
            ),
            TextField(
              decoration: InputDecoration(hintText: '설명을 입력하세요.'),
              controller: textEditingController[6],
            ),
            TextField(
              decoration: InputDecoration(hintText: '물품 개수를 입력하세요.'),
              controller: textEditingController[2],
            ),
            TextField(
              decoration: InputDecoration(hintText: '위치를 입력하세요.'),
              controller: textEditingController[3],
            ),
            TextField(
              decoration: InputDecoration(hintText: '전화번호를 입력하세요.'),
              controller: textEditingController[4],
            ),


          ],
        ),
      ),
    );
  }

  void _getImage() async {
    final image = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      _image = image;
    });
  }
}
