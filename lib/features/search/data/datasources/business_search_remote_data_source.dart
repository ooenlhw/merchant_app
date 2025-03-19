import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/business_model.dart';
import '../../../../core/error/exceptions.dart';

class BusinessSearchRemoteDataSource {
  List<Map<String, Object>> sampleRes = [
    {
      "id": 4,
      "title": "Samsung 49-Inch Monitor",
      "price": 999.99,
      "description": "Curved Gaming Monitor with HDR...",
      "category": "electronics",
      "image": "https://fakestoreapi.com/img/monitor.jpg",
      "rating": {"rate": 4.5, "count": 320}
    }
  ];
  // categories keyword "electronics", "jewelery", "men's clothing", "women's clothing"

  Future<List<BusinessModel>> searchBusinesses(String query) async {
    print('search keyword $query');
    final response = await http
        .get(Uri.parse('https://fakestoreapi.com/products/category/$query'));

    if (response.statusCode == 200) {
      List jsonData = json.decode(response.body);
      print('search response data $jsonData');
      return jsonData.map((e) => BusinessModel.fromJson(e)).toList();
    } else {
      throw ServerException(message: "Failed to fetch businesses");
    }
  }
}
