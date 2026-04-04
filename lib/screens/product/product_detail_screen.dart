import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/product_model.dart';
import '../../providers/cart_provider.dart';
import '../../core/utils/format_utils.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(product.name)),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: 240,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.network(
                    product.imageUrl,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) =>
                        const Center(child: Icon(Icons.toys, size: 48)),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                product.name,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12),
              Text(product.description, style: const TextStyle(fontSize: 16)),
              const SizedBox(height: 16),
              Text(
                'Giá: ${product.price.toVnd()}',
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.redAccent,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Tồn kho: ${product.stock}',
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: product.stock > 0
                    ? () {
                        context.read<CartProvider>().addProduct(product);
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Đã thêm vào giỏ hàng')),
                        );
                      }
                    : null,
                child: const Text('Thêm vào giỏ'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
