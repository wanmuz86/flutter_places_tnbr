import 'package:flutter/material.dart';
import 'package:places/models/Register.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
class RegisterPage extends StatelessWidget {
  var usernameController = TextEditingController();
  var passwordController = TextEditingController();
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
                controller: usernameController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  hintText: "Email",
                ),
              ),
              TextField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: "Password",
                ),
              ),
              TextButton(
                style: TextButton.styleFrom(
                    backgroundColor: Colors.red, primary: Colors.white),
                onPressed: () {
                  if (usernameController.text != "" && passwordController.text != "") {
                    FocusScope.of(context).unfocus();
                    registerUser(
                        usernameController.text, passwordController.text).then((
                        register) =>
                    {
                      if (register.message == "User succesfully registered!"){
                        // TODO show toast
                        Fluttertoast.showToast(
                        msg: "User succesfully register. You may login",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.CENTER,
                    )

                      }
                    });
                  }
                  else {
                    // TODO show a toast password or username cannot be empty
                    Fluttertoast.showToast(
                      msg: "Username and password cannot be empty",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.CENTER,
                    );

                  }
                },
                child: Text("Register"),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<Register> registerUser(String username, String password) async {
    final response = await http.post(
      Uri.parse('https://gentle-escarpment-90591.herokuapp.com/api/register'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'username': username,
        'password': password
      }),
    );

    if (response.statusCode == 200) {
      return Register.fromJson(jsonDecode(response.body));
    } else {

      throw Exception('Failed to register user.');
    }
  }
}
