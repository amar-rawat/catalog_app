import 'package:catalog_app/models/cart_model.dart';
import 'package:catalog_app/themes/mytheme.dart';
import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyTheme.creamColor,
      appBar: AppBar(backgroundColor: Colors.transparent, title: Text('Cart')),
    );
  }
}
