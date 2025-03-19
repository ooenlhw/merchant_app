class Product {
  final String id;
  final String name;
  final String description;
  final double price;
  final int stock;
  final String image;
  final String category;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.stock,
    required this.image,
    required this.category
  });

  Product copyWith({String? name, String? description, double? price, int? stock}) {
    return Product(
      id: id,
      name: name ?? this.name,
      description: description ?? this.description,
      price: price ?? this.price,
      stock: stock ?? this.stock,
      image: image,
      category: category
    );
  }
}
