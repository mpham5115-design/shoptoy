import '../../models/category_model.dart';
import '../../models/product_model.dart';

class SampleDataService {
  static List<CategoryModel> getCategories() {
    return [
      CategoryModel(id: 1, name: 'Xe điều khiển'),
      CategoryModel(id: 2, name: 'Búp bê'),
      CategoryModel(id: 3, name: 'Xếp hình'),
      CategoryModel(id: 4, name: 'Robot'),
      CategoryModel(id: 5, name: 'Thể thao'),
    ];
  }

  static List<ProductModel> getProducts() {
    return [
      ProductModel(
        id: 1,
        name: 'Xe đồ chơi điều khiển',
        description: 'Xe ô tô điều khiển từ xa cho bé.',
        price: 249000,
        imageUrl: 'https://images.unsplash.com/photo-1542291026-7eec264c27ff',
        stock: 14,
        categoryId: 1,
      ),
      ProductModel(
        id: 2,
        name: 'Búp bê thời trang',
        description: 'Búp bê xinh xắn với nhiều phụ kiện thời trang.',
        price: 179000,
        imageUrl:
            'https://images.unsplash.com/photo-1512436991641-6745cdb1723f',
        stock: 9,
        categoryId: 2,
      ),
      ProductModel(
        id: 3,
        name: 'Bộ xếp hình gỗ',
        description: 'Bộ xếp hình bằng gỗ giúp rèn luyện tư duy.',
        price: 129000,
        imageUrl:
            'https://images.unsplash.com/photo-1524758631624-e2822e304c36',
        stock: 17,
        categoryId: 3,
      ),
      ProductModel(
        id: 4,
        name: 'Robot biến hình',
        description: 'Robot biến hình thành xe hơi siêu thú vị.',
        price: 329000,
        imageUrl:
            'https://images.unsplash.com/photo-1526035436495-ec5c2f4a1b1f',
        stock: 6,
        categoryId: 4,
      ),
      ProductModel(
        id: 5,
        name: 'Bóng nhựa vui nhộn',
        description: 'Bóng nhựa nhiều màu an toàn cho bé.',
        price: 49000,
        imageUrl:
            'https://images.unsplash.com/photo-1518609878373-06d740f60d8b',
        stock: 24,
        categoryId: 5,
      ),
    ];
  }
}
