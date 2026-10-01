class Product {
  final int id;
  final String name;
  final String? description;
  final String? image;
  final int stock;
  final int price;
  final int categoryId;

  Product({
    required this.id, required this.name, this.description,
    this.image, required this.stock, required this.price,
    required this.categoryId,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    id: _toInt(json['id']),
    name: json['name'] ?? '',
    description: json['description'], image: json['image'],
    stock: _toInt(json['stock']), price: _toInt(json['price']),
    categoryId: _toInt(json['category_id']),
  );

  static int _toInt(dynamic value) =>
      value is int ? value : int.parse(value.toString());
}