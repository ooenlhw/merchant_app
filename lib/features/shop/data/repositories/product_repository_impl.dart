import 'package:merchant_app/features/shop/domain/repositories/product_repository.dart';

import 'package:merchant_app/features/shop/domain/entities/product.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ProductApiRepository implements ProductRepository {
  final String apiUrl;

  ProductApiRepository(this.apiUrl);

  @override
  Future<List<Product>> fetchProducts() async {
    final response =
        await http.get(Uri.parse('https://fakestoreapi.com/products/3'));
    print("product api response: ${response}");
    if (response.statusCode == 200) {
      print("product api result: ${response.body}");
      final data = json.decode(response.body) as List;
      return data
          .map((e) => Product(
              id: e['id'],
              name: e['title'],
              description: e['description'],
              price: e['price'],
              stock: e['rating'],
              image: e['image'],
              category: e['category']))
          .toList();
    } else {
      throw Exception('Failed to fetch products');
    }
  }

  @override
  Future<void> addProduct(Product product) async {
    await http.post(Uri.parse('$apiUrl/products'), body: {
      'name': product.name,
      'description': product.description,
      'price': product.price.toString(),
      'stock': product.stock.toString(),
    });
  }

  @override
  Future<void> updateProduct(Product product) async {
    await http.put(Uri.parse('$apiUrl/products/${product.id}'), body: {
      'name': product.name,
      'description': product.description,
      'price': product.price.toString(),
      'stock': product.stock.toString(),
      'image': product.image,
      'category': product.category
    });
  }

  @override
  Future<void> deleteProduct(String id) async {
    await http.delete(Uri.parse('$apiUrl/products/$id'));
  }
}
