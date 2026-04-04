import 'product_model.dart';

class OrderItem {
  OrderItem({required this.product, this.quantity = 1});

  final ProductModel product;
  int quantity;
}

class OrderModel {
  OrderModel({
    required this.id,
    required this.items,
    required this.totalPrice,
    required this.date,
  });

  final int id;
  final List<OrderItem> items;
  final double totalPrice;
  final DateTime date;
}
