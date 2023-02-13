import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'model/cart_model.dart';

class CartView extends StatelessWidget {
  const CartView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            child: Consumer<CartModel>(
              builder: (context, cart, _) {
                return ListView.builder(
                  itemCount: cart.count,
                  itemBuilder: (context, index) {
                    final listData = cart.items[index];
                    return ListTile(
                      title: Text(listData.title.toString()),
                      subtitle: Text(listData.price.toString()),
                      trailing: IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: () {
                          cart.remove(index);
                        },
                      ),
                    );
                  },
                );
              },
            ),
          ),
          const Divider(
            height: 5,
            thickness: 2,
          ),
          Consumer<CartModel>(
            builder: (context, cart, _) {
              return Text(cart.totalPrice.toString());
            },
          )
        ],
      ),
    );
  }
}
