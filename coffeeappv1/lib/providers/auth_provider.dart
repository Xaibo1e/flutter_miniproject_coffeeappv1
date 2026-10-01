import 'package:flutter/material.dart';
import '../models/user.dart';
import '../services/auth_service.dart';

class AuthProvider with ChangeNotifier {
  final AuthService authService;

  AuthProvider({required this.authService});

  bool _isLoading = false;
  String? _errorMessage;
  String? _token;
  User? _user;

  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;
  String? get token => _token;
  User? get user => _user;

  // เมธอด login ตามบทเรียน STEP 2
  Future<bool> login(String email, String password) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final data = await authService.login(email: email, password: password);
      _token = data['token'];
      _user = User.fromJson(data['user']);
      return true;
    } catch (e) {
      _errorMessage = e.toString().replaceFirst('Exception: ', '');
      return false;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  // ฟังก์ชัน Logout สำหรับเคลียร์ session
  void logout() {
    _token = null;
    _user = null;
    notifyListeners();
  }
}