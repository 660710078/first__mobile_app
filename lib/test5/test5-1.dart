import 'package:first_app/test5/test5-2.dart';
import 'package:flutter/material.dart';

class MyWidget9 extends StatelessWidget {
  const MyWidget9({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('First Page')
              ,backgroundColor: Colors.amber
      ),
      body:Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: (){
                Navigator.push(context,
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) => const MyWidget10(name:'Cream',age:19)
                  )
                );
              } 
            , child: Text('Second Page >>')),

            SizedBox(height: 20,),
            ElevatedButton(onPressed: (){
              Navigator.pushNamed(context, '/counter');
            }, child: Text('Counter page >>')),
          ],
        ),
      )
    );
  }
}