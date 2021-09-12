// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(home: Home(),)) ;
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Catalog",
        style: TextStyle(
          color: Colors.black ,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.grey[200],
      ),
      body : Center(
        child:Text("30 Day of Code" ,
        style: TextStyle(
          color: Colors.black,
          ),
        ),
      )
    );
  }
}