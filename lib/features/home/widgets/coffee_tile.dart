import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../_data/models/coffee_item.dart';
import '../../bloc/app_bloc.dart';
import '../../detail/views/detail_screen.dart';

class CoffeeTile extends StatelessWidget {
  final CoffeeItem item;

  const CoffeeTile({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    final appBloc = BlocProvider.of<AppBloc>(context);
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DetailScreen()),
        );
      },
      child: Card(
        child: Wrap(
          children: <Widget>[
            Stack(
              children: [
                Image.network(
                  'https://via.placeholder.com/100',
                  fit: BoxFit.cover,
                ),
                Text(item.rating.toString())
              ],
            ),
            ListTile(
              title: Text(item.name),
              subtitle: Text('\$${item.price}'),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton.filled(
                      onPressed: () {
                        appBloc.add(AppAddItemToOrder(item));
                      },
                      icon: const Icon(Icons.add)),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
