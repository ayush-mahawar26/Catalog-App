// ignore_for_file: prefer_const_constructors

import 'package:catalog_app/pages/cart.dart';
import 'package:catalog_app/pages/catalog_item.dart';
import 'package:catalog_app/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'pages/home_screen.dart';
import 'package:catalog_app/Widget/theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.light,
      theme: MyTheme.themeData,
      debugShowCheckedModeBanner: false,

      // Routes -> having all the screen info in App
      routes: {
        "/": (context) => HomePage(),
        "/home": (context) => HomePage(),
        "/login": (context) => LoginPage(),
        "/cart": (context) => MyCart(),
        "/catalog_item": (context) => CatalogItem(),
      },
    );
  }
}
