import 'package:flutter/foundation.dart';

class ApiConfig {
  static String get baseUrl {
    if (kIsWeb) return 'http://localhost:3000';
    if (defaultTargetPlatform == TargetPlatform.android) {
      return 'http://192.168.1.107:3000';
    }
    return 'http://localhost:3000';
  }

  static String get login => '$baseUrl/api/auth/login';
  static String get products => '$baseUrl/api/products';
  static String productById(int id) => '$baseUrl/api/products/$id';
}