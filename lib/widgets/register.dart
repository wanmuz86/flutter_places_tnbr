import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Register"),),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.network("https://www.cyclonis.com/images/2020/04/Yelp_Logo.jpg"),
              TextField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  hintText: "Email",
                ),
              ),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  hintText: "Password",
                ),
              ),
              TextButton(
                style: TextButton.styleFrom(
                    backgroundColor: Colors.red, primary: Colors.white),
                onPressed: () {



                },
                child: Text("Register"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
