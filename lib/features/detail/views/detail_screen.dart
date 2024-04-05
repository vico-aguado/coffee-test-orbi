import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const String coffeeName = 'Cappuccino with Chocolate';
    const double coffeePrice = 4.53;
    const String coffeeImage = 'assets/images/placeholder_coffe.jpg';
    const double coffeeRating = 4.8;
    const int coffeeRatingCount = 230;
    const String coffeeDescription =
        'A cappuccino is an approximately 150 ml (5 oz) beverage, with 25 ml of espresso coffee and 85ml of fresh milk.';

    return Scaffold(
      appBar: AppBar(
        title: const Text(coffeeName),
      ),
      body: ListView(
        children: <Widget>[
          Image.asset(
            coffeeImage,
            height: 300,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  coffeeName,
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Row(
                  children: <Widget>[
                    Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    Text(
                      '$coffeeRating ($coffeeRatingCount reviews)',
                      style: TextStyle(
                        fontSize: 18.0,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                Text(
                  coffeeDescription,
                  style: TextStyle(fontSize: 16.0),
                ),
                // Aquí puede ir más información sobre el café y opciones de personalización.
                // ...
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                const Text(
                  '\$$coffeePrice',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    // TODO: Implement add to cart functionality
                  },
                  child: const Text('Buy now'),
                ),
              ],
            ),
          ),
          // Más widgets pueden ser agregados aquí para completar la información del producto
        ],
      ),
    );
  }
}
