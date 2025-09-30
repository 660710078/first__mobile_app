import 'package:first_app/navigation_example/second_page.dart';
import 'package:flutter/material.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('First Page')
              ,backgroundColor: Colors.amber
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: (){
              Navigator.push(context,
                MaterialPageRoute<void>(
                  builder: (BuildContext context) => const SecondPage(name:'Peter',age: 20)
                )
              );
            }, child: Text('Second Page >>')),

            SizedBox(height: 20,),
            ElevatedButton(onPressed: (){
              Navigator.pushNamed(context, '/counter');
            }, child: Text('Counter page >>')),
          ],
        ),
      ),

    );

  }
}