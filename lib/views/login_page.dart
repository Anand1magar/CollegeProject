import 'package:bookshelf_app/state/auth_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:bookshelf_app/views/introPage.dart' as intro;
import 'home.dart' as home;
import 'signup_page.dart' as signup;
import 'package:bookshelf_app/service/auth_services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import "bottom_nav_screen.dart" as nav;

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

bool isSwitched = false;

class _LoginPageState extends State<LoginPage> {
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();

  _navigateToSignUp() {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return signup.SignUp();
    }));
  }

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
                        "Log In!",
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
                            controller: _password,
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
                        SizedBox(height: 50.0),
                        InkWell(
                          onTap: () async {
                            final email = _email.text;
                            final pass = _password.text;
                            print("email: $email, password: $pass");
                            final user = await AuthService.signUpWithEmail(
                                email: email, password: pass);

                            if (user != null) {
                              context.read(userProvider).state = user;
                              // Navigator.pushReplacement(context,
                              //     MaterialPageRoute(builder: (context) {
                              //   return home.MyHomePage(user: user);
                              // }));
                              print(" Successfully login ");
                            } else {
                              print("error loggin in");
                            }
                          },
                          child: Container(
                            width: 250.0,
                            height: 70,
                            child: Center(
                              child: Text(
                                "Log in ",
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
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 110.0,
                                top: 20.0,
                              ),
                              child: Image(
                                image: AssetImage(
                                  'assets/icons/facebook.png',
                                ),
                                width: 40.0,
                              ),
                            ),
                            SizedBox(
                              width: 30,
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 20),
                              child: InkWell(
                                onTap: () async {
                                  //user will save the credential
                                  final user =
                                      await AuthService.signInWithGoogle();
                                  if (user != null) {
                                    context.read(userProvider).state = user;
                                    //assigning user value to userProvider form /lib/state/aut_state.dart
                                    Navigator.pushReplacement(context,
                                        MaterialPageRoute(builder: (context) {
                                      return nav.BottomNavScreen();
                                    }));
                                  } else {
                                    print("error logging in");
                                  }
                                },
                                child: Image(
                                  image: AssetImage('assets/icons/search.png'),
                                  width: 40.0,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 30,
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 20),
                              child: Image(
                                image: AssetImage('assets/icons/twitter.png'),
                                width: 40.0,
                              ),
                            )
                          ],
                        ),
                        InkWell(
                          onTap: _navigateToSignUp,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Create an account !",
                              style: TextStyle(color: Colors.purple),
                            ),
                          ),
                        )
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
