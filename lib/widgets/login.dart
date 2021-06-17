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
