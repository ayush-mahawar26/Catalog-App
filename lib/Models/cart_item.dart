import 'package:catalog_app/Models/catalog.dart';

class CartItems {
  Map itemForCart;
  static List<Items> cartItem = [];

  CartItems(this.itemForCart) {
    Items catalogItem = Items(
        name: itemForCart["name"],
        id: itemForCart["id"],
        desc: itemForCart["desc"],
        price: itemForCart["price"],
        color: itemForCart["color"],
        img: itemForCart["img"]);
    cartItem.add(catalogItem);
  }
}
