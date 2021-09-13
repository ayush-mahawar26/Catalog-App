// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 2,
      child: Container(
        color: Colors.deepPurple,
        child: ListView(
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            DrawerHeader(
                padding: EdgeInsets.zero,
                child: UserAccountsDrawerHeader(
                  currentAccountPicture: CircleAvatar(
                    backgroundImage: NetworkImage(
                        "https://images.unsplash.com/photo-163118751"
                        "2153-807144860f80?ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw1fHx8"
                        "ZW58MHx8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60"),
                  ),
                  accountName: Text("Ayush"),
                  accountEmail: Text("ayushm2605@gmail.com"),
                )),
            ListTile(
              leading: Icon(
                CupertinoIcons.home,
                color: Colors.white,
              ),
              title: Text("Home",
                  textScaleFactor: 1.2, style: TextStyle(color: Colors.white)),
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.person_crop_circle_fill,
                color: Colors.white,
              ),
              title: Text("Profile",
                  textScaleFactor: 1.2, style: TextStyle(color: Colors.white)),
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.star_lefthalf_fill,
                color: Colors.white,
              ),
              title: Text("Rate",
                  textScaleFactor: 1.2, style: TextStyle(color: Colors.white)),
            )
          ],
        ),
      ),
    );
  }
}
