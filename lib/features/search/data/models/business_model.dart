import 'package:dartz/dartz.dart';
import '../../domain/entities/business.dart';

class BusinessModel extends Business {
  const BusinessModel({
    required super.id,
    required super.title,
    required super.description,
    required super.category,
    required super.image,
  });

  // Convert JSON to BusinessModel
  factory BusinessModel.fromJson(Map<String, dynamic> json) {
    return BusinessModel(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      category: json['category'] as String,
      image: json['image'] as String,
    );
  }

  // Convert BusinessModel to JSON (for API requests or local storage)
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'category': category,
      'image': image,
    };
  }

  // Create a copy of BusinessModel with updated values
  BusinessModel copyWith({
    String? id,
    String? title,
    String? description,
    String? category,
    String? image,
  }) {
    return BusinessModel(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      category: category ?? this.category,
      image: image ?? this.image,
    );
  }
}
