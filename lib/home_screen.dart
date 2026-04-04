import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Toy Store"),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              // TODO: chuyển sang màn giỏ hàng
            },
          )
        ],
      ),

      body: Column(
        children: [
          // 🔍 Thanh tìm kiếm
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Tìm đồ chơi...",
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),

          // 📦 Danh sách sản phẩm
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(10),
              itemCount: 10, // demo 10 sản phẩm
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // 2 cột
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 0.7,
              ),
              itemBuilder: (context, index) {
                return _buildProductCard();
              },
            ),
          ),
        ],
      ),
    );
  }

  // 🧸 Widget sản phẩm
  Widget _buildProductCard() {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 🖼️ Hình ảnh
          Expanded(
            child: ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
              child: Image.network(
                "https://picsum.photos/200",
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ),

          // 📄 Thông tin
          Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "Đồ chơi siêu nhân",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 5),
                Text(
                  "150.000đ",
                  style: TextStyle(color: Colors.red),
                ),
              ],
            ),
          ),

          // 🛒 Nút thêm giỏ hàng
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 35),
              ),
              child: const Text("Thêm vào giỏ"),
            ),
          ),

          const SizedBox(height: 5),
        ],
      ),
    );
  }
}