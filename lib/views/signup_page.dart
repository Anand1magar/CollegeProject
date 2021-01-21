import 'package:bookshelf_app/service/auth_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'home.dart' as home;
import 'package:bookshelf_app/views/introPage.dart' as intro;
import 'package:google_sign_in/google_sign_in.dart';
import 'bottom_nav_screen.dart' as nav;
import 'login_page.dart' as login;

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

TextEditingController email = TextEditingController();
TextEditingController a = TextEditingController();

bool isSwitched = false;

class _SignUpState extends State<SignUp> {
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();

  showError(String errorMessage) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("ERROR"),
            content: Text(errorMessage),
            actions: [
              FlatButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("OK"),
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  //     margin: EdgeInsets.only(top:h/15),
                  height: h / 1.6,
                  width: w,
                  child: RotatedBox(
                    quarterTurns: 0,
                    child: FlareActor(
                      'assets/icons/curve.flr',
                      animation: 'Flow',
                      alignment: Alignment.bottomCenter,
                      fit: BoxFit.fill,
                      // isPaused: x,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: w / 4, left: w / 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Welcome Back",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.w600),
                      ),
                      Text(
                        "Sign Up",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 52,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: h / 2),
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    //when we are dealing with form we need form key
                    child: Column(
                      children: [
                        Container(
                          child: TextField(
                            controller: _email,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                                labelText: "Your Name",
                                labelStyle: TextStyle(color: Colors.purple),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: BorderSide(
                                      color: Colors.purple, width: 1.0),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: BorderSide(
                                      color: Colors.purple, width: 1.0),
                                )),
                          ),
                        ),
                        SizedBox(height: 30.0),
                        Container(
                          child: TextField(
                            controller: _password,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                                labelText: "Email Address",
                                labelStyle: TextStyle(color: Colors.purple),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: BorderSide(
                                      color: Colors.purple, width: 1.0),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: BorderSide(
                                      color: Colors.purple, width: 1.0),
                                )),
                          ),
                        ),
                        SizedBox(height: 30.0),
                        Container(
                          child: TextField(
                            obscureText: true,
                            decoration: InputDecoration(
                              labelText: "Password",
                              labelStyle: TextStyle(color: Colors.purple),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: BorderSide(
                                    color: Colors.purple, width: 1.0),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: BorderSide(
                                    color: Colors.purple, width: 1.0),
                              ),
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            Switch(
                              value: isSwitched,
                              onChanged: (value) {
                                setState(() {
                                  isSwitched = value;
                                  print(isSwitched);
                                });
                              },
                            ),
                            Text("Remember me"),
                            SizedBox(
                              width: 100.0,
                            ),
                            Text("Forgot password?"),
                          ],
                        ),
                        SizedBox(height: 30.0),
                        InkWell(
                          onTap: () async {
                            final email = _email.text;
                            final pass = _password.text;
                            print("email: $email, password: $pass");
                            final user = await AuthService.signUpWithEmail(
                                email: email, password: pass);

                            if (user != null) {
                              Navigator.pushReplacement(context,
                                  MaterialPageRoute(builder: (context) {
                                return home.MyHomePage(user: user);
                              }));
                            } else {
                              return showError("Error occure try agaain");
                            }
                          },
                          child: Container(
                            width: 250.0,
                            height: 70,
                            child: Center(
                              child: Text(
                                "Sign Up",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 25.0),
                              ),
                            ),
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    Color(0xff9969C7),
                                    Color(0xff552586)
                                  ],
                                ),
                                borderRadius: BorderRadius.circular(40),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.purple.withOpacity(0.3),
                                    spreadRadius: 3,
                                    blurRadius: 4,
                                    offset: Offset(
                                        0, 3), // changes position of shadow
                                  ),
                                ]),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
