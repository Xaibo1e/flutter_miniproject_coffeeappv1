import 'package:flutter/material.dart';
import '../models/product.dart';
import '../services/product_service.dart';

class ProductProvider with ChangeNotifier {
  final ProductService productService;

  ProductProvider({required this.productService});

  List<Product> _products = [];
  bool _isLoading = false;
  String? _errorMessage;

  List<Product> get products => _products;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  // เมธอดดึงรายการสินค้า
  Future<void> fetchProducts(String token) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      _products = await productService.getProducts(token);
    } catch (e) {
      _errorMessage = e.toString().replaceFirst('Exception: ', '');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}