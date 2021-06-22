import 'package:flutter/material.dart';
import 'package:places/widgets/review.dart';

class DetailPage extends StatefulWidget {
  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
     return Scaffold(
      appBar: AppBar(title: Text("Detail"),),
      body: Center(
        child: Column(
          children: [
            Text("Place name"),
            Text("Place description"),
            Text("Place categories"),
            Text("Place average rating"),
            TextButton(onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context)=>ReviewPage())
              );
            }, child: Text("Add new Review"))
          ],
        ),
      ),
    );
  }
}
