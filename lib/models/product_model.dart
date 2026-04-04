class ProductModel {
  ProductModel({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
    required this.stock,
    required this.categoryId,
  });

  final int id;
  final String name;
  final String description;
  final double price;
  final String imageUrl;
  final int stock;
  final int categoryId;
}
