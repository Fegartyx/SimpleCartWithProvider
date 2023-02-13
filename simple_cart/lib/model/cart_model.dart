import 'package:flutter/cupertino.dart';
import 'package:simple_cart/model/list_data.dart';

class CartModel with ChangeNotifier {
  final List<ListData> _items = [];
  double _price = 0;

  void add(ListData listData) {
    _items.add(listData);
    _price += listData.price!;
    debugPrint(' $items price: $totalPrice');
    notifyListeners();
  }

  int get count => _items.length;

  double get totalPrice => _price;

  List<ListData> get items => _items;

  void remove(int index) {
    _price -= _items[index].price!;
    _items.removeAt(index);
    debugPrint(' $items price: $totalPrice');
    notifyListeners();
  }

  void removeAll() {
    _items.clear();
    notifyListeners();
  }
}
