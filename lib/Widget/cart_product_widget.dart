// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'package:catalog_app/Models/catalog.dart';
import 'package:flutter/material.dart';

class CartItemWidget extends StatelessWidget {
  Items itemForCart;
  CartItemWidget({Key? key, required this.itemForCart}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image(
            image: NetworkImage(itemForCart.img),
            width: 50,
            height: 50,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                itemForCart.name,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                width: 200,
                child: Text(
                  itemForCart.desc,
                  style: TextStyle(color: Colors.grey[500], fontSize: 13),
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "\$ ${itemForCart.price.toString()}",
                  style: TextStyle(fontSize: 13, color: Colors.grey[600]),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text("Buy"),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
