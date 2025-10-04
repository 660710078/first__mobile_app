import 'dart:collection';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:first_app/week5/Product.dart';
import 'package:first_app/week5/EditProductPage.dart';
import 'package:first_app/week5/CreateProductPage.dart';

class Assignment extends StatefulWidget {
  const Assignment({super.key});

  @override
  State<Assignment> createState() => _AssignmentState();
}

class _AssignmentState extends State<Assignment> {
  List<Product> listProduct = [];
  @override
  void initState() {
    super.initState();
    //เรียกเมื่อเริ่มต้น
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      var response = await http.get(
        Uri.parse('http://localhost:8001/products'),
      );
      if (response.statusCode == 200) {
        List<dynamic> jsonList = jsonDecode(response.body);
        setState(() {
          listProduct = jsonList.map((item) => Product.fromJson(item)).toList();
        });
      } else {
        throw Exception("Failed to load products");
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> createProduct() async {
    try {
      var response = await http.post(
        Uri.parse("http://localhost:8001/products"),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "name": "iPhone 7s",
          "description": "Apple smartphone",
          "price": 21999.00,
        }),
      );
      if (response.statusCode == 201) {
        //code somthing...
      } else {
        throw Exception("Failed to load products");
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> updateProduct({dynamic idUpdate = "2"}) async {
    try {
      var response = await http.put(
        Uri.parse("http://localhost:8001/products/$idUpdate"),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "name": "iPhone 5 plus",
          "description": "Apple smartphone",
          "price": 34900.00,
        }),
      );
      if (response.statusCode == 200) {
        //code somthing...
      } else {
        throw Exception("Failed to load products");
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> deleteProduct({dynamic idDelete = "2"}) async {
    try {
      var response = await http.delete(
        Uri.parse("http://localhost:8001/products/$idDelete"),
      );
      if (response.statusCode == 200) {
        //code somthing...
      } else {
        throw Exception("Failed to delete products");
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(39, 33, 177, 243),

        title: Text('API Example List'),
        centerTitle: true,
        actions: [ElevatedButton(onPressed: fetchData, child: Text('refresh'))],
      ),
      body: Stack(
        children: [
          ListView.separated(
            itemCount: listProduct.length,
            //สร้างรายการ
            itemBuilder: (BuildContext context, int index) {
              final item = listProduct[index];
              //ListTile เป็น Widget ที่ใช้แสดงรายการ
              return Slidable(
                key: Key(item.id.toString()),

                endActionPane: ActionPane(
                  motion: StretchMotion(),
                  extentRatio: 0.3,
                  children: [
                    SlidableAction(
                      onPressed: (context) {
                        Navigator.push(
                          context,
                          MaterialPageRoute<void>(
                            builder: (BuildContext context) =>
                                EditProductPage(product: item),
                          ),
                        ).then((value) {
                          fetchData();
                        });
                      },
                      backgroundColor: Colors.lightBlueAccent,
                      foregroundColor: Colors.white,
                      icon: Icons.edit,
                      label: 'Edit',
                    ),
                    SlidableAction(
                      onPressed: (context) {
                        showDialog(
                          context: context,
                          builder: (BuildContext ctx) {
                            return AlertDialog(
                              title: const Text('Please Confirm'),
                              content: const Text(
                                'Are you sure you want to delete this product?',
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () => Navigator.of(ctx).pop(),
                                  child: const Text('Cancel'),
                                ),
                                TextButton(
                                  onPressed: () {
                                    deleteProduct(idDelete: item.id).then((_) {
                                      fetchData();
                                    });
                                    Navigator.of(ctx).pop();
                                  },
                                  child: const Text(
                                    'Delete',
                                    style: TextStyle(color: Colors.red),
                                  ),
                                ),
                              ],
                            );
                          },
                        );
                      },
                      backgroundColor: Colors.pinkAccent,
                      foregroundColor: Colors.white,
                      icon: Icons.delete,
                      label: 'Delete',
                    ),
                  ],
                ),

                child: ListTile(
                  leading: Text('${item.id}'),
                  title: Text(
                    item.name,
                  ), // ไม่จำเป็นต้องใช้ '${}' ถ้ามีแค่ตัวแปรตัวเดียว
                  trailing: Text('Price : ${item.price}'),
                  subtitle: Text('Description : ${item.description}'),
                ),
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return Divider();
            },
          ),
          Positioned(
            bottom: 25,
            right: 25,
            child: FloatingActionButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Createproductpage(),
                  ),
                ).then((_) {
                  fetchData();
                });
              },
              backgroundColor: Colors.green,
              tooltip: 'Add Product', 
              child: const Icon(Icons.add, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
