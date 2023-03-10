import 'package:flutter/material.dart';
import 'package:simple_cart/cart_view.dart';
import 'package:simple_cart/model/cart_model.dart';
import 'package:simple_cart/model/list_data.dart';
import 'package:provider/provider.dart';
import 'package:badges/badges.dart' as badges;

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
                  return badges.Badge(
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
                debugPrint(dataList.quantity.toString());
                noChange.add(dataList);
                noChange.showButton = true;
              },
              child: const Text('Add'),
            ),
          );
        },
      ),
      floatingActionButton: Consumer<CartModel>(
        builder: (context, cart, _) {
          return noChange.showButton
              ? SizedBox(
                  width: 200,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      shape: MaterialStatePropertyAll(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const CartView(),
                        ),
                      );
                    },
                    child: Row(
                      children: [
                        Text('${cart.items.length} items added'),
                        const Spacer(),
                        Text('${noChange.totalPrice}\$'),
                      ],
                    ),
                  ),
                )
              : const SizedBox();
        },
      ),
    );
  }
}
