import 'package:flutter/material.dart';

class MyWidget10 extends StatelessWidget {
  final String name;
  final int age;
  const MyWidget10({super.key,required this.name,required this.age});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Second Page')
              ,backgroundColor: Colors.blue
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Name $name | Age $age'),
            ElevatedButton(onPressed: (){
              Navigator.pop(context);
            }, child: Text('<< First Page')),
          ],
        ),
      ),
    );
  }
}