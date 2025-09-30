import 'package:flutter/material.dart';

//ไม่มีการเปลี่ยนแปลใดๆทั้งสิ้น
// StatelessWidget จะไม่สามารถเปลี่ยนแปลงค่าได้
class GreetingWidget extends StatelessWidget {
  final String name;
  final Color colorBox;
  final Widget chlidWidget;
  const GreetingWidget({
    super.key,
    this.name = "World",
    this.colorBox = Colors.red,
    required this.chlidWidget,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("First Stateless Widget"),
      ),
      body: Center(
        child: Container(color: colorBox,child: chlidWidget,),
      ),
    );
  }
}