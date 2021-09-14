// ignore_for_file: prefer_const_constructors, avoid_print

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var changeState = false;
  final _formValidate = GlobalKey<FormState>();

  void moveToHome(BuildContext context) async {
    if (_formValidate.currentState!.validate()) {
      setState(() {
        changeState = true;
      });

      await Future.delayed(Duration(seconds: 1));
      await Navigator.pushReplacementNamed(context, "/home");

      setState(() {
        changeState = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Material(
          color: Colors.white,
          child: Scaffold(
            resizeToAvoidBottomInset: true,
            body: SingleChildScrollView(
              child: Form(
                key: _formValidate,
                child: Column(
                  children: [
                    Image.asset(
                      "assets/images/login_page.png",
                      fit: BoxFit.contain,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Welcome",
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.purple[900]),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(30, 10, 30, 20),
                      child: Column(
                        children: [
                          TextFormField(
                            decoration: InputDecoration(
                                hintText: "Enter Username",
                                labelText: "Username"),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return ("Username cannot be Empty");
                              } else {
                                return null;
                              }
                            },
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          TextFormField(
                            validator: (password) {
                              if (password!.isEmpty == true) {
                                return "Password cannot be Empty";
                              } else if (password.length < 6) {
                                return "Lenght of password should be more than 6";
                              } else {
                                return null;
                              }
                            },
                            obscureText: true,
                            decoration: InputDecoration(
                              hintText: "Enter Password",
                              labelText: "Password",
                            ),
                          ),
                          SizedBox(height: 30),
                          InkWell(
                            onTap: () async {
                              // Navigator.pushNamed(context, "/home");
                              moveToHome(context);
                            },
                            child: AnimatedContainer(
                              duration: Duration(seconds: 1),
                              width: changeState ? 50 : 150,
                              height: 40,
                              child: Center(
                                child: changeState
                                    ? Icon(
                                        Icons.done,
                                        color: Colors.white,
                                      )
                                    : Text(
                                        "Login",
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                              ),
                              decoration: BoxDecoration(
                                  color: Colors.deepPurple,
                                  borderRadius: BorderRadius.circular(
                                      changeState ? 50 : 5)),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
