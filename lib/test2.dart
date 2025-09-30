import 'package:flutter/material.dart';

class MyWidget6 extends StatelessWidget {
  const MyWidget6({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First Application',style: TextStyle(color: Colors.amber)),
        backgroundColor: Colors.blueGrey,
      ),
      body: Column(
        children: [
          SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 20,),
              Container(width: 100, height: 100, color: Colors.red,),
              SizedBox(width: 20,),
              Container(width: 100, height: 100, color: Colors.green,),
              SizedBox(width: 20,),
              Container(width: 100,height: 100,color: Colors.blue),
            ],
          ),
          SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 20,),
              Expanded(
                flex: 1,//อัตราการขยายเป็น 1 ส่วน
                child:Container(width: 100,height: 100,color: Colors.red,)),
              SizedBox(width: 20),
              Expanded(
                flex: 2,
                child:Container(width: 100,height: 100,color: Colors.green,)),
              SizedBox(width: 20),
            ]
          ),
        ],
      )
      
    );
  }
}