import 'package:merchant_app/features/shop/domain/entities/product.dart';

abstract class ProductRepository {
  Future<List<Product>> fetchProducts();
  Future<void> addProduct(Product product);
  Future<void> updateProduct(Product product);
  Future<void> deleteProduct(String id);
}
