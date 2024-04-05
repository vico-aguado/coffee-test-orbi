import 'dart:convert';
import 'package:flutter/services.dart';

import '../models/coffee_item.dart';

abstract class CoffeeItemsRepository {
  Future<List<CoffeeItem>> getItems();
}

class CoffeeItemsRepositoryImpl extends CoffeeItemsRepository {
  @override
  Future<List<CoffeeItem>> getItems() async {
    try {
      await Future.delayed(const Duration(seconds: 2));
      final jsonResult =
          await rootBundle.load('lib/_data/datasource/coffe_shop_info.json');
      final jsonBuffer = jsonResult.buffer;
      var intList = jsonBuffer.asUint8List(
          jsonResult.offsetInBytes, jsonResult.lengthInBytes);
      final jsonDecoded = utf8.decode(intList);

      final result = json.decode(jsonDecoded);
      final List<CoffeeItem> items = result['menuItems']
          .map<CoffeeItem>((item) => CoffeeItem.fromJson(item))
          .toList();

      return items;
    } catch (e) {
      throw Exception('Error loading coffe items');
    }
  }
}
