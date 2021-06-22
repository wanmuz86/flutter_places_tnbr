import 'package:flutter/material.dart';
import 'package:places/models/login.dart';
import 'package:places/widgets/place.dart';
import 'package:places/widgets/register.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatelessWidget {

  var usernameController = TextEditingController();
  var passwordController = TextEditingController();
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
                onPressed: ()  {
                  
                  FocusScope.of(context).unfocus();
                  // TODO Navigate to page places
                  loginUser(usernameController.text, passwordController.text).then(
                          (loginResponse)  =>
                  {
                    if (loginResponse.success == true){

                     SharedPreferences.getInstance().then((prefs){

                      prefs.setString("token", loginResponse.token!.split(" ").last);
                       Navigator.push(
                           context,
                           MaterialPageRoute(builder: (context)=>PlacePage())
                       );
                     })
                  


                }
                    else {
                      Fluttertoast.showToast(
                        msg: "Login failed",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.CENTER,
                      )
                    }

                  });
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(builder: (context)=>PlacePage())
                  // );

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

  Future<Login> loginUser(String username,String password) async {
    final response = await http.post(
      Uri.parse('https://gentle-escarpment-90591.herokuapp.com/api/login'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'username': username,
        'password':password
      }),
    );

    if (response.statusCode == 200) {

      return Login.fromJson(jsonDecode(response.body));
    } else {

      throw Exception('Failed to login user');
    }
  }
}
