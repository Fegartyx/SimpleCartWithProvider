class ListData {
  String? title;
  int? price;
  int? id;
  int quantity;

  ListData({this.id, this.price, this.title, required this.quantity});
}

List<ListData> listData = [
  ListData(id: 1, title: 'Garam', price: 25, quantity: 1),
  ListData(id: 2, title: 'Gula', price: 50, quantity: 1),
];
