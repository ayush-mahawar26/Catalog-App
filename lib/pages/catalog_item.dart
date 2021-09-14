// ignore_for_file: no_logic_in_create_state, prefer_const_constructors

import 'package:catalog_app/Models/cart_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CatalogItem extends StatefulWidget {
  const CatalogItem({Key? key}) : super(key: key);

  @override
  _CatalogItemState createState() => _CatalogItemState();
}

class _CatalogItemState extends State<CatalogItem> {
  Map itemCatalog = {};
  Map productQty = {};
  int qty = 0;

  @override
  Widget build(BuildContext context) {
    itemCatalog =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    int currentItemPrice = itemCatalog["price"];

    int addQty() {
      qty += 1;
      if (qty > 0) {
        setState(() {
          currentItemPrice *= qty;
        });
      }

      return qty;
    }

    int decreaseQty() {
      if (qty > 0) {
        qty -= 1;
        if (qty > 0) {
          setState(() {
            currentItemPrice *= qty;
          });
        }
      }
      return qty;
    }

    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Image(
            image: NetworkImage(itemCatalog["img"]),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.4,
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: Container(
              color: Colors.grey[200],
              child: Column(children: [
                SizedBox(
                  height: 30,
                ),
                Center(
                  child: Text(
                    itemCatalog["name"],
                    style: TextStyle(
                        color: Colors.grey[800],
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        fontFamily: GoogleFonts.poppins().fontFamily),
                  ),
                ),
                Center(
                  child: Text(
                    itemCatalog["desc"],
                    style: TextStyle(
                        color: Colors.grey[400],
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        fontFamily: GoogleFonts.poppins().fontFamily),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          addQty();
                        });
                      },
                      child: Container(
                          width: 60,
                          decoration: BoxDecoration(
                              color: Colors.deepPurple[200],
                              borderRadius: BorderRadius.circular(20)),
                          padding: EdgeInsets.all(10),
                          child: Icon(CupertinoIcons.add)),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "$qty",
                      style: TextStyle(color: Colors.grey[800], fontSize: 20),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          decreaseQty();
                        });
                      },
                      child: Container(
                          width: 60,
                          decoration: BoxDecoration(
                              color: Colors.deepPurple[200],
                              borderRadius: BorderRadius.circular(20)),
                          padding: EdgeInsets.all(10),
                          child: Icon(CupertinoIcons.minus)),
                    ),
                  ],
                ),
                Text(
                  "\$${currentItemPrice.toString()}/-",
                  style: TextStyle(
                      fontFamily: GoogleFonts.poppins().fontFamily,
                      color: Colors.grey[800],
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.5 - 10,
                          child: ElevatedButton.icon(
                              style: ButtonStyle(
                                  padding: MaterialStateProperty.all(
                                      EdgeInsets.all(15)),
                                  shape: MaterialStateProperty.all(
                                      StadiumBorder())),
                              onPressed: () {
                                setState(() {
                                  CartItems(itemCatalog);

                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          content: Text("Item added to Cart")));
                                });
                              },
                              icon: Icon(CupertinoIcons.cart),
                              label: Text("Add To Cart")),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.5 - 10,
                          child: ElevatedButton.icon(
                              style: ButtonStyle(
                                padding: MaterialStateProperty.all(
                                    EdgeInsets.all(15)),
                                shape:
                                    MaterialStateProperty.all(StadiumBorder()),
                              ),
                              onPressed: () {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        content: Text(
                                            "Buying is not supported Right Now")));
                              },
                              icon: Icon(CupertinoIcons.bag),
                              label: Text("Buy")),
                        )
                      ],
                    ),
                  ),
                )
              ]),
            ),
          ),
        ],
      ),
    );
  }
}
