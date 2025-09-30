import 'package:flutter/material.dart';

class MyWidget5 extends StatelessWidget {
  const MyWidget5({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First Application',style: TextStyle(color:Colors.amber)),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: Center(
        child: 
          Container(
            alignment: Alignment.center,
            width: 250,
            height: 250,
            color: Colors.white,
            child: Text('Hello World',style: TextStyle(color: Colors.black))
          ),
      ),
    );
  }
}