// ignore_for_file: prefer_const_constructors

import 'package:catalog_app/Models/cart_item.dart';
import 'package:catalog_app/Widget/cart_product_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyCart extends StatefulWidget {
  const MyCart({Key? key}) : super(key: key);

  @override
  _MyCartState createState() => _MyCartState();
}

class _MyCartState extends State<MyCart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // My Cart Label Text Design
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  "Cart",
                  style: TextStyle(
                      color: Colors.grey[800],
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      fontFamily: GoogleFonts.poppins().fontFamily),
                ),
              ),

              // Subtitle Design
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                child: Text(
                  "My Items",
                  style: TextStyle(
                      color: Colors.grey[400],
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      fontFamily: GoogleFonts.poppins().fontFamily),
                ),
              ),

              Expanded(
                child: ListView.builder(
                    itemCount: CartItems.cartItem.length,
                    itemBuilder: (context, index) {
                      return CartItemWidget(
                          itemForCart: CartItems.cartItem[index]);
                    }),
              )
            ],
          ),
        ));
  }
}
