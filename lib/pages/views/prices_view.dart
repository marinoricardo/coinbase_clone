// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_brace_in_string_interps

import 'package:coinbase_clone/controllers/prices_controller.dart';
import 'package:flutter/material.dart';

import '../../models/price.dart';

class PricesView extends StatefulWidget {
  const PricesView({Key? key}) : super(key: key);

  @override
  State<PricesView> createState() => _PricesViewState();
}

class _PricesViewState extends State<PricesView> {
  final PricesController _pricesController = PricesController();

  late Future<List<Price>> prices;
  @override
  void initState() {
    super.initState();

    prices = _pricesController.pegarDados();
    print("object");
    print(prices);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('Prices'),
      ),
      body: Center(
        child: FutureBuilder<List<Price>>(
            future: prices,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.separated(
                    itemCount: snapshot.data!.length,
                    separatorBuilder: (BuildContext context, int index) =>
                        const Divider(),
                    itemBuilder: (context, index) {
                      var price = double.parse(snapshot.data![index].priceUsd!)
                          .toStringAsFixed(2);
                      var change =
                          double.parse(snapshot.data![index].changePercent24Hr!)
                              .toStringAsFixed(2);
                      return ListTile(
                        title: Text(snapshot.data![index].name!),
                        subtitle: Text(snapshot.data![index].symbol!),
                        trailing: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text('USD ${price}'),
                            Text('${change} %'),
                          ],
                        ),
                        leading: CircleAvatar(
                            child: Image.network(
                                'https://cryptoicons.org/api/icon/${snapshot.data![index].symbol!.toLowerCase()}/30')),
                        // leading: Text(snapshot.data![index].id.toString()),
                      );
                    });
              } else if (snapshot.hasError) {
                return Text(snapshot.error.toString());
              }

              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(),
                    SizedBox(
                      height: 10,
                    ),
                    Text('Processando..'),
                  ],
                ),
              );
            }),
      ),
    );
  }
}
