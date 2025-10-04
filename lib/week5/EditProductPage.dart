import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:first_app/week5/Product.dart';

class EditProductPage extends StatefulWidget {
  // 1. เปลี่ยนจากรับ id เป็นรับ Product object
  final Product product;
  const EditProductPage({super.key, required this.product});

  @override
  State<EditProductPage> createState() => _EditProductPageState();
}

class _EditProductPageState extends State<EditProductPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();//formKey 
  //_formKey และ TextEditingController ทั้ง 3 ตัวยังคงทำหน้าที่เดิม คือควบคุม Form และช่องกรอกข้อความ
  late final TextEditingController _nameController;
  late final TextEditingController _descriptionController;
  late final TextEditingController _priceController;

  @override
  void initState() {
    super.initState();
    // 2. ใช้ข้อมูลจาก widget.product ข้อมูลเดิม เพื่อกำหนดค่าเริ่มต้นให้ Controller
    _nameController = TextEditingController(text: widget.product.name);
    _descriptionController = TextEditingController(text: widget.product.description);
    _priceController = TextEditingController(text: widget.product.price.toString());
    
  }

  // ส่วนนี้ยังคงเหมือนเดิม คือการคืนหน่วยความจำเมื่อ Widget ถูกทำลาย
  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    _priceController.dispose();
    super.dispose();
  }

  // ปรับปรุงฟังก์ชัน _updateProduct() เล็กน้อย
  Future<void> _updateProduct() async {
    // ใช้ค่าเดิมจาก widget.product ใน intitState() ถ้าช่องกรอกข้อความว่าง
    final String updatedName = _nameController.text.trim().isNotEmpty
        ? _nameController.text.trim()
        : widget.product.name;
        
    final String updatedDescription = _descriptionController.text.trim().isNotEmpty
        ? _descriptionController.text.trim()
        : widget.product.description;
        
    final double updatedPrice = double.tryParse(_priceController.text.trim()) ?? widget.product.price;

    try {
      final response = await http.put(
        // ใช้ id จาก widget.product
        Uri.parse("http://localhost:8001/products/${widget.product.id}"),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "name": updatedName,
          "description": updatedDescription,
          "price": updatedPrice,
        }),
      );

      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Product updated successfully!')),
        );
        Navigator.pop(context);
      } else {
        throw Exception("Failed to update product. Status code: ${response.statusCode}");
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ใช้ id จาก widget.product เพื่อแสดงบน AppBar
      appBar: AppBar(title: Text('Edit Product #${widget.product.id}')),
      // เอาส่วนของ Loading Indicator ออกได้เลย เพราะข้อมูลพร้อมใช้งานทันที
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: 'Name'),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _descriptionController,
                decoration: const InputDecoration(labelText: 'Description'),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _priceController,
                decoration: const InputDecoration(labelText: 'Price'),
                keyboardType: const TextInputType.numberWithOptions(decimal: true),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _updateProduct();
                  }
                },
                child: const Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}