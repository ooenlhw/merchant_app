import 'package:merchant_app/features/shop/domain/entities/merchant.dart';
import 'package:merchant_app/features/shop/domain/repositories/merchant_repository.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class MerchantApiRepository implements MerchantRepository {
  final String apiUrl;
  final http.Client client;
  // final Map<String, dynamic> resdum = {
  //   "accessToken":
  //       "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwidXNlcm5hbWUiOiJlbWlseXMiLCJlbWFpbCI6ImVtaWx5LmpvaG5zb25AeC5kdW1teWpzb24uY29tIiwiZmlyc3ROYW1lIjoiRW1pbHkiLCJsYXN0TmFtZSI6IkpvaG5zb24iLCJnZW5kZXIiOiJmZW1hbGUiLCJpbWFnZSI6Imh0dHBzOi8vZHVtbXlqc29uLmNvbS9pY29uL2VtaWx5cy8xMjgiLCJpYXQiOjE3NDA2MzMxNTcsImV4cCI6MTc0MDYzNDk1N30.40_8bo4x_1IMFFOUc97uYsisTFxm88rm09NTOL1O0FE",
  //   "refreshToken":
  //       "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwidXNlcm5hbWUiOiJlbWlseXMiLCJlbWFpbCI6ImVtaWx5LmpvaG5zb25AeC5kdW1teWpzb24uY29tIiwiZmlyc3ROYW1lIjoiRW1pbHkiLCJsYXN0TmFtZSI6IkpvaG5zb24iLCJnZW5kZXIiOiJmZW1hbGUiLCJpbWFnZSI6Imh0dHBzOi8vZHVtbXlqc29uLmNvbS9pY29uL2VtaWx5cy8xMjgiLCJpYXQiOjE3NDA2MzMxNTcsImV4cCI6MTc0MzIyNTE1N30.z1lUn5u3jHqOWk1qQQ8cIgTiJDEd6u13XiarZHiEdT0",
  //   "id": 1,
  //   "username": "emilys",
  //   "email": "emily.johnson@x.dummyjson.com",
  //   "firstName": "Emily",
  //   "lastName": "Johnson",
  //   "gender": "female",
  //   "image": "https://dummyjson.com/icon/emilys/128"
  // };
  MerchantApiRepository(this.apiUrl, {required this.client});

  @override
  Future<Merchant> login(String email, String password) async {
    final response =
        await http.post(Uri.parse('https://dummyjson.com/auth/login'), body: {
      'username': email, // emilys
      'password': password, // emilyspass
    });
    print("api result: ${response.body}");
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return Merchant(
        id: data['id'] != null ? data['id'].toString() : '',
        username: data['username'],
        name: data['firstName'] + data['lastName'],
        email: data['email'],
        gender: data['gender'],
        image: data['image'],
        actoken: data['accessToken'],
        reftoken: data['refreshToken'],
      );
    } else {
      throw Exception(
          'Login failed with status ${response.statusCode}: ${response.body}');
    }
  }

  @override
  Future<Merchant> signup(String name, String email, String password) async {
    final response = await http.post(
      Uri.parse('$apiUrl/signup'),
      body: {'name': name, 'email': email, 'password': password},
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return Merchant(
        id: data['id'],
        username: data['username'],
        name: data['name'],
        email: data['email'],
        gender: data['gender'],
        image: data['image'],
        actoken: data['accessToken'],
        reftoken: data['refreshToken'],
      );
    } else {
      throw Exception('Failed to sign up');
    }
  }
}
