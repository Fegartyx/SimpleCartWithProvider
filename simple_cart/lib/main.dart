import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_cart/data_view.dart';
import 'package:simple_cart/model/cart_model.dart';
import 'package:simple_cart/model/list_data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CartModel()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        debugShowCheckedModeBanner: false,
        home: const DataView(),
      ),
    );
  }
}
