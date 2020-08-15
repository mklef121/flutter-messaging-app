import 'package:flutter/material.dart';

Widget topBar(){
  return AppBar(
        elevation: 0.0,
        leading: IconButton(
            icon: Icon(Icons.menu),
            iconSize: 30.0,
            color: Colors.white,
            onPressed: () {}),
        title: Center(
          child: Text("Chats",
              style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold)),
        ),
        actions: [
          IconButton(
              icon: Icon(Icons.search),
              iconSize: 30.0,
              color: Colors.white,
              onPressed: () {}
              ),
        ],
      );
}