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
                    return Card(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(listData.title.toString()),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(listData.price.toString()),
                            ],
                          ),
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                ElevatedButton(
                                  onPressed: () {
                                    cart.addQuantity(index);
                                  },
                                  style: ElevatedButton.styleFrom(
                                      shape: const CircleBorder()),
                                  child: const Icon(Icons.add),
                                ),
                                Text(listData.quantity.toString()),
                                ElevatedButton(
                                  onPressed: () {
                                    cart.decreaseQuantity(index);
                                    cart.items.isEmpty
                                        ? cart.showButton = false
                                        : cart.showButton = true;
                                  },
                                  style: ElevatedButton.styleFrom(
                                      shape: const CircleBorder()),
                                  child: const Icon(Icons.remove),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      // trailing: IconButton(
                      //   icon: const Icon(Icons.clear),
                      //   onPressed: () {
                      //     cart.remove(index);
                      //     cart.items.isEmpty
                      //         ? cart.showButton = false
                      //         : cart.showButton = true;
                      //     debugPrint(cart.showButton.toString());
                      //   },
                      // ),
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
