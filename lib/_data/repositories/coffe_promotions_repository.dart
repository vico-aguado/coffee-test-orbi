import 'dart:convert';

import 'package:flutter/services.dart';

import '../models/coffee_promotion.dart';

abstract class CoffeePromotionsRepository {
  Future<List<CoffeePromotion>> getPromotions();
}

class CoffeePromotionsRepositoryImpl extends CoffeePromotionsRepository {
  @override
  Future<List<CoffeePromotion>> getPromotions() async {
    try {
      await Future.delayed(const Duration(seconds: 2));
      final jsonResult =
          await rootBundle.load('lib/_data/datasource/coffe_shop_info.json');
      final jsonBuffer = jsonResult.buffer;
      var intList = jsonBuffer.asUint8List(
          jsonResult.offsetInBytes, jsonResult.lengthInBytes);
      final jsonDecoded = utf8.decode(intList);

      final result = json.decode(jsonDecoded);
      final List<CoffeePromotion> items = result['promotions']
          .map<CoffeePromotion>((item) => CoffeePromotion.fromJson(item))
          .toList();

      return items;
    } catch (e) {
      throw Exception('Error loading coffe promotions');
    }
  }
}
