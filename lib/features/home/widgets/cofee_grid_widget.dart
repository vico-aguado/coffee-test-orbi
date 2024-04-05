import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/app_bloc.dart';
import 'coffee_tile.dart';

class CoffeItemsWidget extends StatelessWidget {
  const CoffeItemsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppState>(
      buildWhen: (previous, current) {
        return current is AppCoffeItemsError ||
            current is AppCoffeItemsLoaded ||
            current is AppCoffeItemsLoading;
      },
      builder: (context, state) {
        if (state is AppCoffeItemsError) {
          return const Center(
            child: Text('Error loading coffee items'),
          );
        }

        if (state is AppCoffeItemsLoaded) {
          return GridView.count(
            crossAxisCount: 2,
            childAspectRatio: 0.8,
            crossAxisSpacing: 4,
            mainAxisSpacing: 4,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: state.model.coffeeItems
                .map((item) => CoffeeTile(
                      item: item,
                    ))
                .toList(),
          );
        }

        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
