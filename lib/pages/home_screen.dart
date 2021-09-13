// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, unused_local_variable, unnecessary_null_comparison

import 'dart:convert';

import 'package:catalog_app/Models/catalog.dart';
import 'package:catalog_app/Widget/drawer.dart';
import 'package:flutter/material.dart';
import 'package:catalog_app/Widget/product_widget.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  // const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();

    loadData();
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 2));
    final catalogJson =
        await rootBundle.loadString("assets/files/item_catalog.json");
    final decodedData = await jsonDecode(catalogJson);

    var productData = decodedData["products"];
    // Catalog.items =
    //     List.from(productData).map((item) => Items.fromJson(item)).toList();

    for (Map i in productData) {
      Catalog.items.add(Items(
          name: i["name"],
          id: i["id"],
          desc: i["desc"],
          price: i["price"],
          color: i["color"],
          img: i["image"]));
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Catalog App",
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
        ),
        drawer: MyDrawer(),
        body: (Catalog.items != null && Catalog.items.isNotEmpty)
            ? ListView.builder(
                itemCount: Catalog.items.length,
                itemBuilder: (context, index) {
                  return ProductWidget(items: Catalog.items[index]);
                })
            : Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
