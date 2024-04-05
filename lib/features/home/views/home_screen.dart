import 'package:flutter/material.dart';
import '../widgets/cofee_grid_widget.dart';
import '../widgets/promotions_widget.dart';
import '../widgets/search_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          IconButton(
            icon: const Icon(Icons.account_circle),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(
        children: const <Widget>[
          Padding(padding: EdgeInsets.all(8.0), child: SearchWidget()),
          Center(child: PromotionsWidget()),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Choose your coffee',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          CoffeItemsWidget()
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          if (value == 2) {
            Navigator.pushNamed(context, '/order');
          }
        },
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: Colors.brown,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite, color: Colors.brown),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag, color: Colors.brown),
            label: 'Orders',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, color: Colors.brown),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
