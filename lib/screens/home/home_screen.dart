import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/auth_provider.dart';
import '../../providers/product_provider.dart';
import '../../routes/app_routes.dart';
import '../../widgets/custom_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider = context.watch<AuthProvider>();
    final productProvider = context.watch<ProductProvider>();

    return Scaffold(
      appBar: AppBar(title: const Text('Quản lý bán đồ chơi')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Xin chào, ${authProvider.user?.name ?? 'Người bán'}',
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              'Tổng sản phẩm: ${productProvider.products.length}',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 24),
            CustomButton(
              label: 'Danh sách sản phẩm',
              onPressed: () =>
                  Navigator.pushNamed(context, AppRoutes.productList),
            ),
            const SizedBox(height: 12),
            CustomButton(
              label: 'Thêm sản phẩm mới',
              onPressed: () =>
                  Navigator.pushNamed(context, AppRoutes.addProduct),
            ),
            const SizedBox(height: 12),
            CustomButton(
              label: 'Đơn hàng',
              onPressed: () => Navigator.pushNamed(context, AppRoutes.orders),
            ),
            const SizedBox(height: 12),
            CustomButton(
              label: 'Hồ sơ',
              onPressed: () => Navigator.pushNamed(context, AppRoutes.profile),
            ),
          ],
        ),
      ),
    );
  }
}
