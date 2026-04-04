import '../screens/auth/login_screen.dart';
import '../screens/auth/register_screen.dart';
import '../screens/cart/cart_screen.dart';
import '../screens/home/home_screen.dart';
import '../screens/order/order_screen.dart';
import '../screens/product/add_product_screen.dart';
import '../screens/product/product_list_screen.dart';
import '../screens/profile/profile_screen.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static const login = '/login';
  static const register = '/register';
  static const home = '/home';
  static const productList = '/product-list';
  static const productDetail = '/product-detail';
  static const addProduct = '/add-product';
  static const cart = '/cart';
  static const orders = '/orders';
  static const profile = '/profile';

  static Map<String, WidgetBuilder> get routes {
    return {
      login: (_) => const LoginScreen(),
      register: (_) => const RegisterScreen(),
      home: (_) => const HomeScreen(),
      productList: (_) => const ProductListScreen(),
      addProduct: (_) => const AddProductScreen(),
      cart: (_) => const CartScreen(),
      orders: (_) => const OrderScreen(),
      profile: (_) => const ProfileScreen(),
    };
  }
}
