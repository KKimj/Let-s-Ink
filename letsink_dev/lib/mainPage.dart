import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text("Main Page"),
      ),
      floatingActionButton: FloatingActionButton(child: Icon(Icons.add_circle),),
    );
  }
}
