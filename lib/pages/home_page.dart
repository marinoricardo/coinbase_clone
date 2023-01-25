// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:coinbase_clone/pages/views/prices_view.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   elevation: 0,
      //   title: Text('Prices'),
      // ),
      body: PageView(
        children: [
          PricesView(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            label: 'Prices',
            icon: Icon(Icons.graphic_eq_outlined),
          ),
          BottomNavigationBarItem(
            label: 'Home',
            icon: Icon(Icons.home),
          ),
        ],
      ),
    );
  }
}
