part of 'app_bloc.dart';

abstract class AppState extends Equatable {
  const AppState(this.model);

  final AppModel model;

  @override
  List<Object> get props => [model];
}

class AppInitial extends AppState {
  const AppInitial(super.model);
}

class AppCoffeItemsLoading extends AppState {
  const AppCoffeItemsLoading(super.model);
}

class AppCoffeItemsLoaded extends AppState {
  const AppCoffeItemsLoaded(super.model);
}

class AppCoffePromotionsLoading extends AppState {
  const AppCoffePromotionsLoading(super.model);
}

class AppCoffePromotionsLoaded extends AppState {
  const AppCoffePromotionsLoaded(super.model);
}

class AppCoffeItemsError extends AppState {
  const AppCoffeItemsError(super.model);
}

class AppCoffePromotionsError extends AppState {
  const AppCoffePromotionsError(super.model);
}

class AppOrderItemsUpdated extends AppState {
  const AppOrderItemsUpdated(super.model);
}

class AppModel extends Equatable {
  final List<CoffeeItem> coffeeItems;
  final List<CoffeePromotion> coffeePromotions;
  final List<CoffeeItem> orderedItems;

  const AppModel({
    required this.coffeeItems,
    required this.coffeePromotions,
    this.orderedItems = const [],
  });

  AppModel copyWith({
    List<CoffeeItem>? coffeeItems,
    List<CoffeePromotion>? coffeePromotions,
    List<CoffeeItem>? orderedItems,
  }) {
    return AppModel(
      coffeeItems: coffeeItems ?? this.coffeeItems,
      coffeePromotions: coffeePromotions ?? this.coffeePromotions,
      orderedItems: orderedItems ?? this.orderedItems,
    );
  }

  @override
  List<Object?> get props => [
        coffeeItems,
        coffeePromotions,
        orderedItems,
      ];
}
