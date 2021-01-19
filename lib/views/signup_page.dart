import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
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
  //here we create the instance of Firebase  which can directely talk with firebase
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //we are using form so we need form key so we need to initialise the GlobleKey, all sigin and signup page are fall under the categories Form
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _email, _password, _name;

  //checked whether the user is login or not, if user is already login there is no need of showing login page
  //for that we have to create the method which contineously checked whather the user is click login button or not
  chcekAuthentication() async {
    //credential
    _auth.authStateChanges().listen((user) {
      if (user != null) {
        Navigator.push(
            context, //If user not have email and password
            MaterialPageRoute(builder: (context) => intro.IntroPage()));
      }
    });
  }

  @override
  void initState() {
    super.initState();
    this.chcekAuthentication();
  }

  signUp() async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();

      try {
        UserCredential user = await _auth.createUserWithEmailAndPassword(
            email: _email, password: _password);

        if (user != null) {
          await _auth.currentUser.updateProfile(displayName: _name);
        }
      } catch (e) {
        showError(e.message);
      }
    }
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
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          Container(
                            child: TextFormField(
                              validator: (input) {
                                if (input.isEmpty) {
                                  return 'Enter your name';
                                }
                              },
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
                              onSaved: (input) => _name = input,
                            ),
                          ),
                          SizedBox(height: 30.0),
                          Container(
                            child: TextFormField(
                              validator: (input) {
                                if (input.isEmpty) {
                                  return 'Enter Email';
                                }
                              },
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
                              onSaved: (input) => _email = input,
                            ),
                          ),
                          SizedBox(height: 30.0),
                          Container(
                            child: TextFormField(
                              validator: (input) {
                                if (input.length < 6)
                                  return "Provide Minimum 6 character";
                              },
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
                              onSaved: (input) => _password = input,
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
                            onTap: signUp,
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
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
