import 'package:flutter/material.dart';
import '../core/services/sample_data_service.dart';
import '../models/product_model.dart';

class ProductProvider extends ChangeNotifier {
  final List<ProductModel> _products = SampleDataService.getProducts();

  List<ProductModel> get products => List.unmodifiable(_products);

  void addProduct(ProductModel product) {
    _products.add(product);
    notifyListeners();
  }

  void updateProduct(ProductModel product) {
    final index = _products.indexWhere((item) => item.id == product.id);
    if (index >= 0) {
      _products[index] = product;
      notifyListeners();
    }
  }

  void removeProduct(int id) {
    _products.removeWhere((product) => product.id == id);
    notifyListeners();
  }

  ProductModel? getById(int id) {
    final matches = _products.where((product) => product.id == id);
    return matches.isEmpty ? null : matches.first;
  }
}
