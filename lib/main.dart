// import 'package:first_app/assignment1.dart';
import 'package:first_app/counter_widget.dart';
import 'package:first_app/greeting_widget.dart';
import 'package:first_app/navigation_example/first_page.dart';
import 'package:first_app/navigation_example/second_page.dart';
import 'package:first_app/profile.dart';
import 'package:first_app/test1.dart';
import 'package:first_app/test2.dart';
import 'package:first_app/test3.dart';
import 'package:first_app/test4.dart';
import 'package:first_app/test5/test5-1.dart';
import 'package:first_app/week4/AQI.dart';
import 'package:first_app/week4/ApiExample.dart';
import 'package:first_app/week4/UserListPage.dart';
// import 'package:first_app/week2.dart';
// import 'package:first_app/week3.dart';
import 'package:flutter/material.dart';

//ไฟล์หลัก เอาไว้เก็บพวกglobal ที่ต้องการให้มีในทุกวwidget
//ทุกอย่าจะเริ่มและรันที่mainเป็นหลัก
void main() {
  runApp(const MyApp());
}

// class state
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  //widget run ที่นี่
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //root widget
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue[500]!,
        ), //chlid widget
      ),
      debugShowCheckedModeBanner:
          false, //defultเป็น True จะได้ไม่ทีหัวคาดว่าdebug
      home: AQI()
    );
  }
}

