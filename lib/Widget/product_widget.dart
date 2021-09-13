// ignore_for_file: unnecessary_null_comparison, prefer_const_constructors, avoid_print, sized_box_for_whitespace

import 'package:catalog_app/Models/catalog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:marquee/marquee.dart';

class ProductWidget extends StatelessWidget {
  final Items items;

  const ProductWidget({Key? key, required this.items})
      : assert(items != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.all(5.0),
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
                padding: EdgeInsets.fromLTRB(0, 10, 10, 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "\$ ${items.price}",
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
        ),
      ),
    );
  }
}
