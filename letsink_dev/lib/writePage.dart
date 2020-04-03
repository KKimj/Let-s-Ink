import 'package:flutter/material.dart';

class WritePage extends StatefulWidget {
  @override
  _WritePageState createState() => _WritePageState();
}

class _WritePageState extends State<WritePage> {
  final textEditingController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    textEditingController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add_a_photo),
        onPressed: () {

        },
      ),
      appBar: AppBar(
        title: Text('게시글 작성'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.send),
            onPressed: () {

            },
          )
        ],
      ),
      body: Column(
        children: <Widget>[
          Text('Write Page'),
          TextField(
            decoration: InputDecoration(hintText: '내용을 입력하세요.'),
            controller: textEditingController,
          )
        ],
      ),
    );
  }
}
