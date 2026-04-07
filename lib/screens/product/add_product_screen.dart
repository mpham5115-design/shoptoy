import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/product_model.dart';
import '../../providers/product_provider.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/input_field.dart';

class AddProductScreen extends StatefulWidget {
  final ProductModel? product;

  const AddProductScreen({super.key, this.product});

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _priceController = TextEditingController();
  final _imageController = TextEditingController();
  final _stockController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    final product = widget.product;
    if (product != null) {
      _nameController.text = product.name;
      _descriptionController.text = product.description;
      _priceController.text = product.price.toString();
      _imageController.text = product.imageUrl;
      _stockController.text = product.stock.toString();
    }
  }

  void _saveProduct() {
    if (_formKey.currentState?.validate() ?? false) {
      final provider = context.read<ProductProvider>();
      final isEditing = widget.product != null;
      final id = isEditing
          ? widget.product!.id
          : (provider.products.isEmpty
                ? 1
                : provider.products.map((item) => item.id).reduce(max) + 1);
      final newProduct = ProductModel(
        id: id,
        name: _nameController.text,
        description: _descriptionController.text,
        price: double.parse(_priceController.text),
        imageUrl: _imageController.text.isEmpty
            ? 'https://images.unsplash.com/photo-1542291026-7eec264c27ff'
            : _imageController.text,
        stock: int.parse(_stockController.text),
        categoryId: widget.product?.categoryId ?? 1,
      );
      if (isEditing) {
        provider.updateProduct(newProduct);
      } else {
        provider.addProduct(newProduct);
      }
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    final isEditing = widget.product != null;

    return Scaffold(
      appBar: AppBar(title: Text(isEditing ? 'Sửa sản phẩm' : 'Thêm sản phẩm')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                InputField(
                  label: 'Tên sản phẩm',
                  controller: _nameController,
                  validator: (value) =>
                      (value?.isEmpty ?? true) ? 'Nhập tên sản phẩm' : null,
                ),
                const SizedBox(height: 12),
                InputField(
                  label: 'Mô tả',
                  controller: _descriptionController,
                  validator: (value) =>
                      (value?.isEmpty ?? true) ? 'Nhập mô tả' : null,
                ),
                const SizedBox(height: 12),
                InputField(
                  label: 'Giá',
                  controller: _priceController,
                  keyboardType: TextInputType.number,
                  validator: (value) =>
                      (value?.isEmpty ?? true) ? 'Nhập giá' : null,
                ),
                const SizedBox(height: 12),
                InputField(
                  label: 'Số lượng tồn',
                  controller: _stockController,
                  keyboardType: TextInputType.number,
                  validator: (value) =>
                      (value?.isEmpty ?? true) ? 'Nhập tồn kho' : null,
                ),
                const SizedBox(height: 12),
                InputField(
                  label: 'URL ảnh',
                  controller: _imageController,
                  validator: (value) => null,
                ),
                const SizedBox(height: 24),
                CustomButton(
                  label: isEditing ? 'Cập nhật sản phẩm' : 'Lưu sản phẩm',
                  onPressed: _saveProduct,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
