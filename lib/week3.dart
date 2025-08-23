import 'package:flutter/material.dart';

class MyWidget2 extends StatelessWidget {
  MyWidget2({super.key});

  List<String> listProduct = ['Apple','Samsung','Oppo','blackberry'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ListView', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
      ),
      body: 
      // ListView.( //scrollได้ กำหนดได้
      //     children: [
      //       Container(
      //         height: 400, //เซต infinite ไม่ได้ เพราะมี column ครอบ
      //         width: double.infinity,//กว้างสุดขอบจอ
      //         color: Colors.red,
      //         child: Text("Item1"),
      //       ),
      //       Container(
      //         height: 200, //เซต infinite ไม่ได้ เพราะมี column ครอบ
      //         width: double.infinity,//กว้างสุดขอบจอ
      //         color: Colors.green,
      //         child: Text("Item2"),
      //       ),
      //       Container(
      //         height: 200, //เซต infinite ไม่ได้ เพราะมี column ครอบ
      //         width: double.infinity,//กว้างสุดขอบจอ
      //         color: Colors.blue,
      //         child: Text("Item3"),
      //       ),
      //       Container(
      //         height: 200, //เซต infinite ไม่ได้ เพราะมี column ครอบ
      //         width: double.infinity,//กว้างสุดขอบจอ
      //         color: Colors.green,
      //         child: Text("Item4"),
      //       )//Overflow
      //     ],
      //   )

        // ListView.builder( //scrollได้ กำหนดได้
        //   itemCount: listProduct.length,
        //   itemBuilder: (context, index){
        //     return Container(
        //       height: 200, //เซต infinite ไม่ได้ เพราะมี column ครอบ
        //       width: double.infinity,//กว้างสุดขอบจอ
        //       color: Colors.green,
        //       child: Text('Item : ${listProduct[index]}'),
        //     );//Overflow
        //   },
        // ),

        // ListView.builder(
        //   itemCount: listProduct.length,
        //   itemBuilder: (context, index){
        //     return ListTile(
        //       leading: Text('${index+1}'),
        //       title: Text(listProduct[index]),
        //       subtitle: Text('loremlorem...'),
        //       trailing: Icon(Icons.edit),
        //     );
        //   },
        // )

        ListView.separated(
          itemCount: listProduct.length,
          itemBuilder: (context, index){
            return ListTile(
              leading: Text('${index+1}'),
              title: Text(listProduct[index]),
              subtitle: Text('loremlorem...'),
              trailing: Icon(Icons.edit),
            );
          },
          separatorBuilder: (context, index) { //เป็นตัวขั้นระหว่างรายการ
            return Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              height: 5,
              width: double.infinity,
              color: Colors.blueAccent,
            );//Overflow
          },
          
      )
    );
  }
}