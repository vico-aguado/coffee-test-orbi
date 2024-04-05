part of 'app_bloc.dart';

abstract class AppEvent extends Equatable {
  const AppEvent();

  @override
  List<Object> get props => [];
}

class AppStarted extends AppEvent {}

class AppLoadCoffeItems extends AppEvent {}

class AppLoadCoffePromotions extends AppEvent {}

class AppAddItemToOrder extends AppEvent {
  final CoffeeItem item;

  const AppAddItemToOrder(this.item);

  @override
  List<Object> get props => [item];
}
