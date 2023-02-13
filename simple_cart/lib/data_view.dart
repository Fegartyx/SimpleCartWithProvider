import 'package:flutter/material.dart';
import 'package:simple_cart/cart_view.dart';
import 'package:simple_cart/model/cart_model.dart';
import 'package:simple_cart/model/list_data.dart';
import 'package:provider/provider.dart';
import 'package:badges/badges.dart';

class DataView extends StatelessWidget {
  const DataView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final noChange = Provider.of<CartModel>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text('List of Data'),
        centerTitle: true,
        elevation: 0,
        actions: [
          Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CartView(),
                  ),
                );
              },
              style: const ButtonStyle(elevation: MaterialStatePropertyAll(0)),
              child: Consumer<CartModel>(
                builder: (context, cart, _) {
                  return Badge(
                    badgeContent: Text(cart.count.toString()),
                    child: const Icon(Icons.shopping_cart),
                  );
                },
              ),
            ),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: listData.length,
        itemBuilder: (context, index) {
          final ListData dataList = listData[index];
          return ListTile(
            title: Text(dataList.title!),
            subtitle: Text('\$ ${dataList.price}'),
            trailing: ElevatedButton(
              onPressed: () {
                noChange.add(dataList);
              },
              child: const Text('Add'),
            ),
          );
        },
      ),
    );
  }
}
