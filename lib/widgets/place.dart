import 'package:flutter/material.dart';
import 'package:places/widgets/detail.dart';
import 'package:places/models/place.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class PlacePage extends StatefulWidget {
  @override
  _PlacePageState createState() => _PlacePageState();
}

class _PlacePageState extends State<PlacePage> {
  List<Place> places = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
   callApi();
  }
  void callApi() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString("token");

    if (token != null){

      retrievePlace(token).then((value) =>
          setState(() {
            places = value;
          })
      );
    }

  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: Text("Place"),),
      body: ListView.separated(
        padding: const EdgeInsets.all(8),
        itemCount: places.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(places[index].name),
            subtitle: Text(places[index].country),
            trailing: Icon(Icons.chevron_right),
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context)=>DetailPage())
              );
            },
          );
        },
        separatorBuilder: (BuildContext context, int index) => const Divider(),
      )
    );
  }

  Future<List<Place>> retrievePlace(String token) async {
    final response = await http.get(
      Uri.parse('https://gentle-escarpment-90591.herokuapp.com/api/places'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization':'Bearer '+token
      }
    );

    if (response.statusCode == 200) {

      return Place.placesFromJson(jsonDecode(response.body));
    } else {

      throw Exception('Failed to create album.');
    }
  }
}
