import 'package:flutter/material.dart';
import 'package:messenger_app/screens/app_body.dart';
import 'package:messenger_app/screens/top_bar.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: topBar(),
      body: appBody(context),
      backgroundColor: Theme.of(context).primaryColor,
    );
  }
}
