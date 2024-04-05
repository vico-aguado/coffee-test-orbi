import 'package:equatable/equatable.dart';

class CoffeePromotion extends Equatable {
  final String title;
  final String imageUrl;

  const CoffeePromotion({required this.title, required this.imageUrl});

  factory CoffeePromotion.fromJson(Map<String, dynamic> json) {
    return CoffeePromotion(
      title: json['title'],
      imageUrl: json['imageUrl'],
    );
  }

  @override
  List<Object?> get props => [title, imageUrl];
}
