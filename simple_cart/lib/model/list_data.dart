class ListData {
  String? title;
  int? price;
  int? id;

  ListData({this.id, this.price, this.title});
}

List<ListData> listData = [
  ListData(id: 1, title: 'Garam', price: 25),
  ListData(id: 2, title: 'Gula', price: 50),
];
