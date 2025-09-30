import 'package:flutter/material.dart';

class MyWidget8 extends StatefulWidget {
  MyWidget8({super.key});

  @override
  State<MyWidget8> createState() => _MyWidget8State();
}
  class _MyWidget8State extends State<MyWidget8> {
    int counter = 0;
    Color boxColor = Colors.blue;

  @override
  void initState() {
      super.initState();
    }
  

  Color getColorBox(){
    if(counter % 2 ==0){
      return Colors.blue;
    }
    else{
      return Colors.red;
    }
  }


  @override
  Widget build(BuildContext context) {
    return 
    Scaffold(
      appBar: AppBar(
        title: Text("My App"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Counter Value',style: TextStyle(fontSize: 20)),

            Text('$counter', style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: (){
                    setState(() {
                      counter++;
                    });
                  }, 
                  child: Text('+ Increment'),),
                ElevatedButton(
                  onPressed: (){
                    setState((){
                      counter--;
                    });
                  }, child: Text('- Decrement'),),
                ElevatedButton(
                  onPressed: (){
                    setState((){
                      counter=0;
                    });
                  },
                  child: Text('Reset'),
                )
              ],
            )
          ],

        )
        ,
      )
      ,
    );
  }
}