import 'package:flutter/material.dart';
import 'package:places/widgets/place.dart';
import 'package:places/widgets/register.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
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
                  // TODO Navigate to page places
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context)=>PlacePage())
                  );

                },
                child: Text("Login"),
              ),
              TextButton(
                onPressed: () {
                  // TODO Navigate to page register
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context)=>RegisterPage())
                  );

                },
                child: Text("No Account? Register now!"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
