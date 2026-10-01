import 'dart:convert';
import 'package:http/http.dart' as http;
import '../config/api_config.dart';
import '../models/product.dart';

class ProductService {
  Future<List<Product>> getProducts(String token) async {
    final response = await http.get(
      Uri.parse(ApiConfig.products),
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode != 200) {
      throw Exception('Cannot load products');
    }

    final data = jsonDecode(response.body);
    final List list = data is List ? data : (data['products'] as List);
    
    return list.map((json) => Product.fromJson(json)).toList();
  }
}