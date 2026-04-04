import 'package:flutter/material.dart';
import '../models/product_model.dart';

class CartItem {
  CartItem({required this.product, this.quantity = 1});

  final ProductModel product;
  int quantity;
}

class CartProvider extends ChangeNotifier {
  final List<CartItem> _items = [];

  List<CartItem> get items => List.unmodifiable(_items);

  int get itemCount => _items.fold(0, (sum, item) => sum + item.quantity);
  double get totalPrice =>
      _items.fold(0, (sum, item) => sum + item.product.price * item.quantity);

  void addProduct(ProductModel product) {
    final existing = _items.where((item) => item.product.id == product.id);
    if (existing.isEmpty) {
      _items.add(CartItem(product: product));
    } else {
      existing.first.quantity += 1;
    }
    notifyListeners();
  }

  void removeProduct(ProductModel product) {
    _items.removeWhere((item) => item.product.id == product.id);
    notifyListeners();
  }

  void updateQuantity(ProductModel product, int quantity) {
    final item = _items.firstWhere(
      (element) => element.product.id == product.id,
      orElse: () => throw ArgumentError('Product not found in cart'),
    );
    item.quantity = quantity;
    if (item.quantity <= 0) {
      _items.remove(item);
    }
    notifyListeners();
  }

  void clearCart() {
    _items.clear();
    notifyListeners();
  }
}
