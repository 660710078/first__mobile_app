import 'package:flutter/material.dart';
import 'dart:convert'; //ใช้สำหรับแปลงข้อมูล JSON (จาก API) ให้กลายเป็น Object
import 'package:http/http.dart' as http; //ใช้สำหรับเรียก API (GET, POST, PUT, DELETE) โดยในที่นี้ใช้ http.get

class ApiExample extends StatefulWidget {
  const ApiExample({super.key});

  @override
  State<ApiExample> createState() => _ApiExampleState(); //สร้าง _ApiExampleState → เอาไว้จัดการ state ของ widget
}

class _ApiExampleState extends State<ApiExample> {
  User? userData;//ใช้เก็บข้อมูลที่ได้จาก API หลังจากแปลง JSON → Object

  @override
  void initState() { //initState() จะรันครั้งเดียวเมื่อเปิดหน้า widget
    super.initState(); 
    fetchUser(); //เรียกใช้ฟังก์ชัน fetchUser() เพื่อดึงข้อมูลจาก API
  }

  void fetchUser() async {
    try {
      var response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users/1')); //เรียก API ด้วย http.get ไปที่ URL
      if (response.statusCode == 200) { //ถ้า statusCode == 200 แสดงว่าดึงข้อมูลสำเร็จ
        var data = jsonDecode(response.body); //ใช้ jsonDecode(response.body) เพื่อแปลง JSON → Map
        User user = User.fromJson(data);  //สร้าง Object User จาก Map ที่ได้จากการแปลง JSON
        setState(() { //ใช้ setState() → อัปเดตค่า userData แล้ว Flutter จะ render UI ใหม่
          userData = user;
        });
      } else {
        print('Failed to fetch data');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('API Example')),
      body: Center(
        child: userData == null
            ? const CircularProgressIndicator()
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("ID: ${userData!.id}"),
                  Text("Name: ${userData!.name}"),
                  Text("Username: ${userData!.username}"),
                  Text("Email: ${userData!.email}"),
                ],
              ),
      ),
    );
  }
}

// Model Class
class User {
  final int id;
  final String name;
  final String username;
  final String email;

  User(this.id, this.name, this.username, this.email);

  User.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        username = json['username'],
        email = json['email'];

  Map<String, dynamic> toJson() {
    return {'id': id, 'name': name, 'username': username, 'email': email};
  }
}
