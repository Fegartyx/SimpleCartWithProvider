import 'package:flutter/cupertino.dart';
import 'package:simple_cart/model/list_data.dart';

class CartModel with ChangeNotifier {
  final List<ListData> _items = [];
  double _price = 0;
  bool showButton = false;

  void add(ListData listData) {
    bool found = false;

    for (int i = 0; i < _items.length; i++) {
      if (_items[i].id == listData.id) {
        _items[i].quantity += 1;
        found = true;
        break;
      }
    }

    if (!found) {
      _items.add(listData);
    }

    _price += listData.price!;
    debugPrint(' $items price: $totalPrice');
    notifyListeners();
  }

  int get count => _items.length;

  double get totalPrice => _price;

  List<ListData> get items => _items;

  void remove(int index) {
    debugPrint('quantity : ${_items[index].quantity}');
    _items.removeAt(index);
    _price = 0;
    notifyListeners();
  }

  void addQuantity(int index) {
    _price += _items[index].price!;
    _items[index].quantity += 1;
    notifyListeners();
  }

  void decreaseQuantity(int index) {
    _price -= _items[index].price!;
    _items[index].quantity -= 1;
    if (_items[index].quantity < 1) {
      _items[index].quantity = 1;
      remove(index);
    }
    notifyListeners();
  }

  void removeAll() {
    _items.clear();
    notifyListeners();
  }
}
