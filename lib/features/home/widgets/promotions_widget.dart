import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/app_bloc.dart';

class PromotionsWidget extends StatelessWidget {
  const PromotionsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppState>(
      buildWhen: (previous, current) {
        return current is AppCoffePromotionsError ||
            current is AppCoffePromotionsLoaded ||
            current is AppCoffePromotionsLoading;
      },
      builder: (context, state) {
        if (state is AppCoffePromotionsError) {
          return Container(
            color: Colors.red[100],
            width: 315,
            height: 140,
            child: const Center(child: Text('Error loading promotions')),
          );
        }

        if (state is AppCoffePromotionsLoaded) {
          return SizedBox(
            width: 315,
            height: 140,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: state.model.coffeePromotions.length,
              itemBuilder: (context, index) {
                final promotion = state.model.coffeePromotions[index];
                return Container(
                  margin: const EdgeInsets.only(right: 8),
                  width: 315,
                  height: 140,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Stack(
                      children: [
                        Positioned(
                          top: 0,
                          left: 0,
                          right: 0,
                          bottom: 0,
                          child: Container(
                            color: Colors.black,
                          ),
                        ),
                        Positioned(
                            top: 10,
                            left: 15,
                            height: 26,
                            width: 60,
                            child: Container(
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: const Text('Promo',
                                    style: TextStyle(
                                      color: Colors.white,
                                    )))),
                        Positioned(
                            left: 15,
                            right: 15,
                            bottom: 10,
                            child: Text(
                              promotion.title,
                              style: const TextStyle(
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            )),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        }

        return Container(
            color: Colors.grey[100],
            width: 315,
            height: 140,
            child: const Center(child: CircularProgressIndicator()));
      },
    );
  }
}
