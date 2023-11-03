import 'package:catalog_app/models/catalog_model.dart';
import 'package:flutter/material.dart';

class ButtonStateProvider with ChangeNotifier {
  bool buttonState;
  ButtonStateProvider({this.buttonState = false});

  changeButton(bool buttonkiState) {
    buttonState = buttonkiState;
    notifyListeners();
  }
}

class CartListProvider extends ChangeNotifier {
  bool isInCart = false;
  List cartList = [];

  void addToCart(index) {
    cartList.add(index);
  }

  void cartButtonState() {
    if (isInCart == false) {
      null;
    } else if (isInCart == true) {
      null;
    }
  }
}

class CatalogModelProvider extends ChangeNotifier {
  late CatalogModel catalog;
  void catalogModel(CatalogModel catalog) {}
}
