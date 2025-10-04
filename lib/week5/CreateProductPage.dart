import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:first_app/week5/Product.dart';

class Createproductpage extends StatefulWidget {
  const Createproductpage({super.key});

  @override
  State<Createproductpage> createState() => _CreateproductpageState();
}

class _CreateproductpageState extends State<Createproductpage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>(); //formKey

  late final TextEditingController _nameController;
  late final TextEditingController _descriptionController;
  late final TextEditingController _priceController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _descriptionController = TextEditingController();
    _priceController = TextEditingController();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    _priceController.dispose();
    super.dispose();
  }

  Future<void> _createProduct() async {
    // final String name = _nameController.text.trim().isNotEmpty
    //     ? _nameController.text.trim()
    //     : "iPhone 7s";

    // final String description = _descriptionController.text.trim().isNotEmpty
    //     ? _descriptionController.text.trim()
    //     : "Apple smartphone";

    // final double price =
    //     double.tryParse(_priceController.text.trim()) ?? 21999.00;
    try {
      var response = await http.post(
        Uri.parse("http://localhost:8001/products"),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "name": _nameController.text,
          "description": _descriptionController.text,
          "price": _priceController.text,
        }),
      );
      if (response.statusCode == 201) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Product created successfully!')),
        );
        Navigator.pop(context);
      } else {
        throw Exception(
          "Failed to create product. Status code: ${response.statusCode}",
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Error: $e')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ใช้ id จาก widget.product เพื่อแสดงบน AppBar
      appBar: AppBar(title: Text('Create Product')),
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
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter Name";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _descriptionController,
                decoration: const InputDecoration(labelText: 'Description'),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter Description";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _priceController,
                decoration: const InputDecoration(labelText: 'Price'),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter Price";
                  }
                  return null;
                },
                keyboardType: const TextInputType.numberWithOptions(decimal: true),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _createProduct();
                  }
                },
                child: const Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );;
  }
}
