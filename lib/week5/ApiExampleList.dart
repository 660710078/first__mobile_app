import 'package:first_app/week4/UserListPage.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiExampleList extends StatefulWidget {
  const ApiExampleList({super.key});

  @override
  State<ApiExampleList> createState() => _ApiExampleListState();
}

class _ApiExampleListState extends State<ApiExampleList> {
  UserEmployee? userEmployee;
  List<UserEmployee> listEmployee = [];
  @override
  void initState() {
    super.initState();
    //เรียกเมื่อเริ่มต้น
    fetchAllUser();
  }

  void fetchAllUser() async {
    try {
      var response = await http.get(
        Uri.parse('https://jsonplaceholder.typicode.com/users/'),
      );
      if (response.statusCode == 200) {
        // var data = jsonDecode(response.body);
        // //แปลงจาก JSONเป็น object
        // //กลายเป็น Object ของคลาส Emplyee
        // setState(() {
        //   userEmployee = UserEmployee.fromJson(data);
        // });

        //แปลงjson เป็น List แบบ dynamic
        List<dynamic> jsonList = jsonDecode(response.body);
        setState(() {
          //วนแปลงจาก List<dynamic> เป็น List<Employee>
          listEmployee = jsonList
              .map((item) => UserEmployee.fromJson(item))
              .toList();
        });
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('API Example List'),
        actions: [
          ElevatedButton(onPressed: fetchAllUser, child: Text('refresh'))],
      ),
      body: ListView.separated(
        itemCount: listEmployee.length,
        //สร้างรายการ
        itemBuilder: (BuildContext context, int index){
          //ListTile เป็น Widget ที่ใช้แสดงรายการ
          return ListTile(
            leading: Text('${listEmployee[index].id}'),
            title: Text('${listEmployee[index].name}'),
            trailing: Text('Email ${listEmployee[index].email}'),
            subtitle: Text('Phone ${listEmployee[index].phone}'),
          );
        },
        //ตัวคั่นระหว่างรายการ
        separatorBuilder: (BuildContext context, int index){
          return Divider();
        },
      )
    );
  }
}

// Model Class
class UserEmployee {
  final int id;
  final String name;
  final String username;
  final String email;
  final String phone;
  // Constructor
  UserEmployee(this.id, this.name, this.username, this.email, this.phone);
  // แปลง JSON เป็น Object
  UserEmployee.fromJson(Map<String, dynamic> json)
    : id = json['id'],
      name = json['name'],
      username = json['username'],
      email = json['email'],
      phone = json['phone'];
  // แปลง Object เป็น JSON Map
  Map<String, dynamic> toJson() {
    return {'id': id, 'name': name, 'username': username, 'email': email};
  }
}
