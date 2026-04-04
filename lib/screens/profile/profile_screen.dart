import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/auth_provider.dart';
import '../../routes/app_routes.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider = context.watch<AuthProvider>();
    final user = authProvider.user;

    return Scaffold(
      appBar: AppBar(title: const Text('Hồ sơ')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: user == null
            ? const Center(child: Text('Chưa đăng nhập'))
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 40,
                    child: Text(user.name.substring(0, 1).toUpperCase()),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Tên: ${user.name}',
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Email: ${user.email}',
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: () {
                      authProvider.logout();
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        AppRoutes.login,
                        (_) => false,
                      );
                    },
                    child: const Text('Đăng xuất'),
                  ),
                ],
              ),
      ),
    );
  }
}
