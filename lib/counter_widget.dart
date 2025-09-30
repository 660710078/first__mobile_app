import 'package:flutter/material.dart';
//stful ย่อเพื่อเริ่ม StatefulWidget
class CounterWidget extends StatefulWidget {
  CounterWidget({super.key});

  @override
  State<CounterWidget> createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  int counter = 0;
  Color boxColor = Colors.blue;

  @override
  void initState() {
    super.initState();
  }

  Color getColorBox(){
    if(counter % 2 == 0){
      return Colors.blue;
    }else{
      return Colors.red;
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stateful Widget Example'),
      ),
      body: Center(
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Counter Value', 
              style: TextStyle(fontSize: 20),),

            Text('$counter',
            style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                  ElevatedButton(onPressed: () {
                    setState(() {
                      counter++;
                    });
                  },child: Text('+ Increment'),),
                  ElevatedButton(onPressed: () {
                    setState(() {
                      counter--;
                    });
                  },child: Text('- Decrement'),),
                  ElevatedButton(onPressed: () {
                    setState(() {
                      counter=0;
                    });
                  },child: Text('reset'),),
              ],
            ),
          ]  
            )
            
            
        
        ),
      );
  }
}