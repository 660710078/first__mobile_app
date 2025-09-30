import 'package:flutter/material.dart';

class MyWidget7 extends StatelessWidget {
  const MyWidget7({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hello', style: TextStyle(color: Colors.amber),),
        backgroundColor: Colors.blueGrey,),
      body: Center(
        child: 
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: 120,height: 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20)
                  ,color: Colors.black
                ),
              ),
              Positioned(
                top: 15,
                child:
                Container(
                  width: 80,height: 80,
                  decoration: BoxDecoration(shape: BoxShape.circle,color: Colors.red),
                ),
              ),
              Positioned(
                //top: 30,
                child:
                Container(
                  width: 80,height: 80,
                  decoration: BoxDecoration(shape: BoxShape.circle,color: Colors.yellow),
                ),
              ),
              Positioned(
                bottom: 15,
                child:
                Container(
                  width: 80,height: 80,
                  decoration: BoxDecoration(shape: BoxShape.circle,color: Colors.green),
                ),
              ),
             


            ],
          )
      ),
    );
  }
}