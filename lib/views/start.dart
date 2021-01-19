import 'package:flutter/material.dart';
import 'package:bookshelf_app/views/login_page.dart' as login;

class StartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FlatButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => login.LoginPage(),
              ),
            );
          },
          color: Colors.purple,
          child: Text(
            "Get Started",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
