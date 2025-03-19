// import 'package:merchant_app/features/shop/domain/entities/merchant.dart';

// class MerchantModel extends Merchant {
//   MerchantModel({
//     required String id,
//     required String username,
//     required String name,
//     required String email,
//     required String gender,
//     required String image,
//   }) : super(
//           id: id,
//           username: username,
//           name: name,
//           email: email,
//           gender: gender,
//           image: image,
//         );

//   factory MerchantModel.fromJson(Map<String, dynamic> json) {
//     return MerchantModel(
//       id: json['id'].toString(),
//       username: json['username'],
//       name: json['firstName'] + json['lastName'],
//       email: json['email'],
//       gender: json['gender'],
//       image: json['image'],
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'id': id,
//       'username': username,
//       'firstName': name.split(' ')[0],
//       'lastName': name.split(' ')[1],
//       'email': email,
//       'gender': gender,
//       'image': image,
//     };
//   }
// }