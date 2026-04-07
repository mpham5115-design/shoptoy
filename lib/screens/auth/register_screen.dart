import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/auth_provider.dart';
import '../../routes/app_routes.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/input_field.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  void _submit() {
    if (_formKey.currentState?.validate() ?? false) {
      context.read<AuthProvider>().register(
        _nameController.text,
        _emailController.text,
        _passwordController.text,
      );
      Navigator.pushReplacementNamed(context, AppRoutes.home);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Đăng ký')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              InputField(
                label: 'Họ và tên',
                controller: _nameController,
                validator: (value) =>
                    (value?.isEmpty ?? true) ? 'Nhập tên' : null,
              ),
              const SizedBox(height: 12),
              InputField(
                label: 'Email',
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Nhập email';
                  }
                  if (!value.trim().toLowerCase().endsWith('@gmail.com')) {
                    return 'Email phải là @gmail.com';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 12),
              InputField(
                label: 'Mật khẩu',
                controller: _passwordController,
                obscureText: true,
                validator: (value) =>
                    (value?.isEmpty ?? true) ? 'Nhập mật khẩu' : null,
              ),
              const SizedBox(height: 20),
              CustomButton(label: 'Đăng ký', onPressed: _submit),
            ],
          ),
        ),
      ),
    );
  }
}
