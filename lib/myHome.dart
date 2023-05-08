import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_market/checkOut.dart';
import './model/item.dart';
import 'model/cart.dart';

class MyHome extends StatefulWidget {
  const MyHome({Key? key}) : super(key: key);

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  List<Item> item = [
    Item(name: 'S20 ultra', price: 250),
    Item(name: 'Poco M4', price: 150),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Home',
          ),
          actions: [
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) {
                          return CheckOut();
                        },
                      ),
                    );
                  },
                  icon: Icon(Icons.shopping_cart),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 5, right: 15),
                  child: Consumer<Cart>(
                    builder: (context, cart, child) {
                      return Text('${cart.totalprice}');
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
        body: Consumer<Cart>(
          builder: (context, cart, child) {
            return ListView.builder(
              itemCount: item.length,
              itemBuilder: (context, i) => Card(
                child: ListTile(
                  title: Text('${item[i].name}'),
                  trailing: IconButton(
                    icon: Icon(Icons.add),
                    onPressed: () {
                      cart.add(item[i]);
                    },
                  ),
                ),
              ),
            );
          },
        ));
  }
}
