//ย่อด้วย stl เพื่อเริ่มต้น StatelessWidget

import 'package:flutter/material.dart';

class Assignment1 extends StatelessWidget {
  const Assignment1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('A1'),
      ),
      body: Center(
        child: Text('Assignment 1'),
      ),
    );
  }
}