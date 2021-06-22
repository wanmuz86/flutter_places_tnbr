import 'package:flutter/material.dart';
import 'package:places/widgets/detail.dart';


class PlacePage extends StatefulWidget {
  @override
  _PlacePageState createState() => _PlacePageState();
}

class _PlacePageState extends State<PlacePage> {
  var places = [{"name":"KLCC","country":"Malaysia"},
    {"name":"Rome","country":"Italy"},
    {"name":"Paris","country":"France"}
  ];
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: Text("Place"),),
      body: ListView.separated(
        padding: const EdgeInsets.all(8),
        itemCount: places.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(places[index]["name"]!),
            subtitle: Text(places[index]["country"]!),
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
}
