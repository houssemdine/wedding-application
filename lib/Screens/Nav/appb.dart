import 'package:flutter/material.dart';

Widget appb() {
  return AppBar(
    title: Text(
      "         Mariage",
      style: TextStyle(fontSize: 30, color: Colors.white),
      textAlign: TextAlign.center,
    ),
    backgroundColor: Colors.teal,
    actions: [
      IconButton(
        icon: Icon(Icons.notifications),
        onPressed: () {},
      ),
    ],
  );
}
