import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '_data/repositories/coffe_items_repository.dart';
import '_data/repositories/coffe_promotions_repository.dart';
import 'features/bloc/app_bloc.dart';
import 'features/detail/views/detail_screen.dart';
import 'features/home/views/home_screen.dart';
import 'features/order/views/order_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppBloc(
        CoffeeItemsRepositoryImpl(),
        CoffeePromotionsRepositoryImpl(),
      )..add(
          AppStarted(),
        ),
      child: MaterialApp(
        title: 'Coffee Shop',
        theme: ThemeData(
          primarySwatch: Colors.brown,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: const HomeScreen(),
        // Define the routes
        routes: {
          '/detail': (context) => DetailScreen(),
          '/order': (context) => OrderScreen(),
        },
      ),
    );
  }
}
