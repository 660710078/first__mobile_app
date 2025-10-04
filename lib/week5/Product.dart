class Product {
  final int id;
  final String name;

  final String description;
  final double price;
  // Constructor
  Product(
    int this.id,
    String this.name,
    String this.description,
    double this.price,
  );
  // แปลง JSON เป็น Object
  Product.fromJson(Map<String, dynamic> json)
    : id = json['id'],
      name = json['name'],
      description = json['description'],
      price = json['price'].toDouble();
  // แปลง Object เป็น JSON Map
  Map<String, dynamic> toJson() {
    return {'id': id, 'name': name, 'description': description, 'price': price};
  }
}