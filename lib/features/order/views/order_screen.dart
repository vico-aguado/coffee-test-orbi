import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/app_bloc.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Order'),
        ),
        body: BlocBuilder<AppBloc, AppState>(
          builder: (context, state) {
            final totalPrice = state.model.orderedItems.fold<double>(
                0, (previousValue, element) => previousValue + element.price);

            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: state.model.orderedItems.length,
                    itemBuilder: (context, index) {
                      final item = state.model.orderedItems[index];
                      return ListTile(
                        title: Text(item.name),
                        subtitle: Text('Price \$${item.price}'),
                        trailing: const Icon(Icons.delete),
                      );
                    },
                  ),
                ),
                const Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Text('Total:'),
                    Text('\$$totalPrice'),
                  ],
                ),
                const SizedBox(
                  height: 20,
                )
              ],
            );
          },
        ));
  }
}
