import 'package:flutter/material.dart';

class PlacePage extends StatefulWidget {
  @override
  _PlacePageState createState() => _PlacePageState();
}

class _PlacePageState extends State<PlacePage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: Text("Place"),),
      body: Text("place"),
    );
  }
}
