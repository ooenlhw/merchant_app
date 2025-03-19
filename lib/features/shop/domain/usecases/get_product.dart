import 'package:merchant_app/features/shop/domain/entities/product.dart';
import 'package:merchant_app/features/shop/domain/repositories/product_repository.dart';

class GetProducts {
  final ProductRepository repository;

  GetProducts(this.repository);

  Future<List<Product>> call() async {
    return await repository.fetchProducts();
  }
}
