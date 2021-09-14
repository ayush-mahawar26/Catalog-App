// ignore_for_file: unnecessary_null_comparison, prefer_const_constructors, avoid_print, sized_box_for_whitespace

import 'package:catalog_app/Models/cart_item.dart';
import 'package:catalog_app/Models/catalog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class ProductWidget extends StatelessWidget {
  final Items items;

  const ProductWidget({Key? key, required this.items})
      : assert(items != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, "/catalog_item", arguments: {
            "name": items.name,
            "color": items.color,
            "price": items.price,
            "id": items.id,
            "desc": items.desc,
            "img": items.img
          });
        },
        child: Card(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image(
                image: NetworkImage(items.img),
                width: 50,
                height: 50,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    items.name,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  Container(
                    width: 200,
                    child: Text(
                      items.desc,
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
                      "\$ ${items.price}",
                      style: TextStyle(fontSize: 13, color: Colors.grey[600]),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Map itemToAdd = {
                          "name": items.name,
                          "id": items.id,
                          "color": items.color,
                          "desc": items.desc,
                          "img": items.img,
                          "price": items.price
                        };

                        CartItems(itemToAdd);

                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("Item added to Cart")));
                      },
                      child: Text("+ Add"),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
