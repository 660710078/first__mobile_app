import 'package:flutter/material.dart';

class MyWidget extends StatelessWidget {
  //stl
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First Time App', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue,
      ),
      body:
          // Center(
          //   // child: Text("Hello World!!",
          //   //   style: TextStyle(
          //   //     fontSize: 32,
          //   //     color: Colors.red,
          //   //     fontWeight: FontWeight.bold
          //   //   )
          //   // ),
          //   child: Container(
          //     width: 250,
          //     height: 250,
          //     color: Colors.blueAccent,
          //     child: Center(
          //       child: Text("Hello, Thitichaya Krueangphatee 660710078",
          //       textAlign: TextAlign.center,
          //       style: TextStyle(
          //         color: Colors.white,
          //         fontWeight: FontWeight.bold,
          //         fontSize: 25)),
          //     )
          //   )
          // )
          // Column(mainAxisAlignment: MainAxisAlignment.center,
          //   children: [
          //     Row(
          //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //       children: [
          //         Container(width: 100,height: 100,color: Colors.blue,),
          //         Container(width: 100,height: 100,color: Colors.red,),
          //         Container(width: 100,height: 100,color: Colors.yellow,)
          //     ]),
          //     Container(width: 100,height: 100,color: Colors.red,),
          //     Container(width: 100,height: 500,color: Colors.blue,),
          //     Container(width: 100,height: 100,color: Colors.yellow,)
          //   ],
          // )
          // Row(
          //     mainAxisAlignment: MainAxisAlignment.start,
          //     children: [
          //     Expanded(//ยืดดตามขนาดหน้าจอโดยไม่เกิดปัญหา
          //         child: Container(width: 20,height: 100,color: Colors.red,),
          //     ),
          //     Expanded(//ยืดดตามขนาดหน้าจอโดยไม่เกิดปัญหา
          //         child: Container(width: 50,height: 100,color: Colors.blue,),
          //     ),
          //     Expanded(//ยืดดตามขนาดหน้าจอโดยไม่เกิดปัญหา
          //         child: Container(width: 100,height: 100,color: Colors.yellow,),
          //     )
          //   ],
          // ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.start,
          //   children: [
          //     Container(width: 100,height: 100,color: Colors.red,),
          //     SizedBox(width: 50,),
          //     Container(width: 100,height: 100,color: Colors.blue,),
          //    Expanded(//ยืดดตามขนาดหน้าจอโดยไม่เกิดปัญหา
          //       child: Container(width: 100,height: 100,color: Colors.yellow,),
          //    )
          //     Container(width: 100,height: 100,color: Colors.yellow,)
          //   ],
          // ),
          // Column(
          //   mainAxisAlignment: MainAxisAlignment.start,
          //   children: [
          //     Container(width: 100,height: 100,color: Colors.red,),
          //     Container(width: 100,height: 100,color: Colors.blue,),
          //     Container(width: 100,height: 100,color: Colors.yellow,)
          //   ],
          // )
          // Column(mainAxisAlignment: MainAxisAlignment.start,
          //   children: [
          //     SizedBox(height: 20),
          //     Row(children: [
          //       SizedBox(width: 20),
          //       Container(width: 100,height: 100,color: Colors.red,),
          //       SizedBox(width: 20),
          //       Container(width: 100,height: 100,color: Colors.green,),
          //       SizedBox(width: 20),
          //       Container(width: 100,height: 100,color: Colors.blue,)
          //     ],),
          //     SizedBox(height: 20),
          //     Row(children: [
          //       SizedBox(width: 20),
          //       Expanded(
          //         flex: 1,//อัตราการขยายเป็น 1 ส่วน
          //         child:Container(width: 100,height: 100,color: Colors.red,)),
          //       SizedBox(width: 20),
          //       Expanded(
          //         flex: 2,
          //         child:Container(width: 100,height: 100,color: Colors.green,)),
          //       SizedBox(width: 20),
          //     ],)
          //   ],
          // )
          // Stack(alignment: AlignmentDirectional.center,
          // children:[
          //   Container(width: 100,height: 100,
          //     //color: Colors.red, กำหนดด้านใน สีกำหนดได้ที่เดียว
          //     decoration: BoxDecoration(shape: BoxShape.circle,color: Colors.red)),
          //   Container(width: 50,height: 50,
          //     //color: Colors.red, กำหนดด้านใน สีกำหนดได้ที่เดียว
          //     decoration: BoxDecoration(shape: BoxShape.circle,color: Colors.green)),
          //   Container(width: 20,height: 20,
          //     //color: Colors.red, กำหนดด้านใน สีกำหนดได้ที่เดียว
          //     decoration: BoxDecoration(shape: BoxShape.circle,color: Colors.blue)),
          // ],)
          
          // Stack(
          //   alignment: AlignmentDirectional.center,
          //   children:[
          //     Container(width: 150,height: 150,color: Colors.red),
          //     Container(width: 100,height: 100,
          //       //color: Colors.red, กำหนดด้านใน สีกำหนดได้ที่เดียว
          //       decoration: BoxDecoration(shape: BoxShape.circle,color: Colors.green)),
          //     Positioned(
          //       top:10,
          //       right: 10,
          //       child: Container(
          //         width: 50,
          //         height: 50,
          //         decoration: BoxDecoration(shape: BoxShape.circle,color: Colors.blue),
          //         child: Text(
          //           '99',
          //           style: TextStyle(),
          //         )
          //       ),
          //     )
          //   ],)



          // Center(
          //   child: Stack(
          //     alignment: AlignmentDirectional.center,
          //     children: [
          //       Container(
          //         width: 120,
          //         height: 300,
          //         decoration: BoxDecoration(
          //           borderRadius: BorderRadius.circular(20),
          //           color: Colors.black,
          //         ),
          //       ),
          //       ////fffffffff
          //       Positioned(
          //         top: 15,
          //         child: Container(
          //           width: 80,
          //           height: 80,
          //           decoration: BoxDecoration(
          //             shape: BoxShape.circle,
          //             color: Colors.red,
          //           ),
          //         ),
          //       ),
          //       Positioned(
          //         child: Container(
          //           width: 80,
          //           height: 80,
          //           decoration: BoxDecoration(
          //             shape: BoxShape.circle,
          //             color: Colors.yellow,
          //           ),
          //         ),
          //       ),
          //       Positioned(
          //         bottom: 15,
          //         child: Container(
          //           width: 80,
          //           height: 80,
          //           decoration: BoxDecoration(
          //             shape: BoxShape.circle,
          //             color: Colors.green,
          //           ),
          //         ),
          //       ),
          //     ],
          //   ),
          // ),

          Center(
            child: 
              Column(mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //Image.network(""), test
                
                Image.asset("cat.jpg"),
                //Icon
                Icon(
                  Icons.remove,
                  size: 150,
                  ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue
                  ),
                  onPressed: (){
                      print('Clicked!');
                  }, 
                  child: Text('Click me!')),
                TextButton(onPressed: (){
                  print('Clicked text button');
                }, child: Text('Click for information!')),
              ],
              )
            )

    
    );
  }
}
