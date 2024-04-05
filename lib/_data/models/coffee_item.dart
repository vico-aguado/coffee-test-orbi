import 'package:equatable/equatable.dart';

class CoffeeItem extends Equatable {
  final String name;
  final String description;
  final double rating;
  final List<String> size;
  final double price;
  final String imageUrl;
  final String id;
  final int quantity;

  const CoffeeItem({
    required this.name,
    required this.description,
    required this.rating,
    required this.size,
    required this.price,
    required this.imageUrl,
    required this.id,
    this.quantity = 1,
  });

  factory CoffeeItem.fromJson(Map<String, dynamic> json) {
    return CoffeeItem(
      name: json['name'],
      description: json['description'],
      rating: json['rating'].toDouble(),
      size: json['size'] is List ? List<String>.from(json['size']) : [],
      price: json['price'].toDouble(),
      imageUrl: json['imageUrl'],
      id: json['id'],
    );
  }

  @override
  List<Object?> get props => [
        name,
        description,
        rating,
        size,
        price,
        imageUrl,
        id,
        quantity,
      ];
}
