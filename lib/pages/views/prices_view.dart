// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class PricesView extends StatefulWidget {
  const PricesView({Key? key}) : super(key: key);

  @override
  State<PricesView> createState() => _PricesViewState();
}

class _PricesViewState extends State<PricesView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('Prices'),
      ),
      body: ListView.builder(
        itemBuilder: ((context, index) {
          return ListTile(
            leading: SizedBox(
              height: 50,
              width: 50,
              child: Image.network('https://cryptoicons.org/api/icon/btc/30'),
            ),
            title: Text('Bitcoin'),
            subtitle: Text('BTC'),
            trailing: Text('USD 1989.98'),
          );
        }),
        itemCount: 1,
      ),
    );
  }
}
