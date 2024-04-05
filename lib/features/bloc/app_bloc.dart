import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../_data/models/coffee_item.dart';
import '../../_data/models/coffee_promotion.dart';
import '../../_data/repositories/coffe_items_repository.dart';
import '../../_data/repositories/coffe_promotions_repository.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc(
    this.itemsRepository,
    this.promotionsRepository,
  ) : super(const AppInitial(AppModel(
          coffeeItems: [],
          coffeePromotions: [],
        ))) {
    on<AppStarted>(_onAppStarted);
    on<AppLoadCoffeItems>(_onLoadCoffeItems);
    on<AppLoadCoffePromotions>(_onLoadCoffePromotions);
    on<AppAddItemToOrder>(_onAddItemToOrder);
  }

  final CoffeeItemsRepository itemsRepository;
  final CoffeePromotionsRepository promotionsRepository;

  void _onAppStarted(AppStarted event, Emitter<AppState> emit) async {
    await Future.delayed(const Duration(milliseconds: 500));
    add(AppLoadCoffeItems());
    add(AppLoadCoffePromotions());
  }

  void _onLoadCoffeItems(
      AppLoadCoffeItems event, Emitter<AppState> emit) async {
    emit(AppCoffeItemsLoading(state.model));

    try {
      final itemsResult = await itemsRepository.getItems();
      final updatedModel = state.model.copyWith(coffeeItems: itemsResult);
      emit(AppCoffeItemsLoaded(updatedModel));
    } catch (e) {
      emit(AppCoffeItemsError(state.model));
    }
  }

  void _onLoadCoffePromotions(
      AppLoadCoffePromotions event, Emitter<AppState> emit) async {
    emit(AppCoffePromotionsLoading(state.model));

    try {
      final promotionsResult = await promotionsRepository.getPromotions();
      final updatedModel =
          state.model.copyWith(coffeePromotions: promotionsResult);
      emit(AppCoffePromotionsLoaded(updatedModel));
    } catch (e) {
      emit(AppCoffePromotionsError(state.model));
    }
  }

  void _onAddItemToOrder(
      AppAddItemToOrder event, Emitter<AppState> emit) async {
    final updatedItems = List<CoffeeItem>.from(state.model.orderedItems)
      ..add(event.item);
    final updatedModel = state.model.copyWith(orderedItems: updatedItems);
    emit(AppOrderItemsUpdated(updatedModel));
  }
}
