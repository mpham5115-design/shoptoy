import 'package:flutter/material.dart';
import '../models/user_model.dart';

class AuthProvider extends ChangeNotifier {
  UserModel? _user;

  UserModel? get user => _user;
  bool get isAuthenticated => _user != null;

  void login(String email, String password) {
    // Demo login đơn giản
    _user = UserModel(id: 1, name: 'Người bán đồ chơi', email: email);
    notifyListeners();
  }

  void register(String name, String email, String password) {
    _user = UserModel(id: 2, name: name, email: email);
    notifyListeners();
  }

  void logout() {
    _user = null;
    notifyListeners();
  }
}
