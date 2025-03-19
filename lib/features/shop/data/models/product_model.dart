// import 'package:merchant_app/features/shop/domain/entities/product.dart';

// class ProductModel extends Product {
//   ProductModel({
//     required super.id,
//     required super.name,
//     required super.description,
//     required super.price,
//     required String imageUrl,
//   }) : super(
//           id: id,
//           name: name,
//           description: description,
//           price: price,
//           imageUrl: imageUrl,
//         );

//   factory ProductModel.fromJson(Map<String, dynamic> json) {
//     return ProductModel(
//       id: json['id'].toString(),
//       name: json['name'],
//       description: json['description'],
//       price: json['price'].toDouble(),
//       imageUrl: json['imageUrl'],
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'id': id,
//       'name': name,
//       'description': description,
//       'price': price,
//       'imageUrl': imageUrl,
//     };
//   }
// }