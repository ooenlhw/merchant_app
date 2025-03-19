import 'package:equatable/equatable.dart';

class Business extends Equatable {
  final String id;
  final String title; // name
  final String description; // address
  final String category;
  final String image; //imageUrl

  const Business({
    required this.id,
    required this.title,
    required this.description,
    required this.category,
    required this.image,
  });

  @override
  List<Object> get props => [id, title, description, category, image];
}
