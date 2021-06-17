import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: Column(
        children: [
          Image.network("https://upload.wikimedia.org/wikipedia/commons/thumb/a/ad/Yelp_Logo.svg/1200px-Yelp_Logo.svg.png"),
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
            onPressed: () {},
            child: Text("Login"),
          ),
          TextButton(
            onPressed: () {},
            child: Text("No Account? Register now!"),
          )
        ],
      ),
    );
  }
}
