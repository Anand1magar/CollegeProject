import 'package:flutter/material.dart';

class BookMark extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Book Mark"),
      ),
      body: Container(
        child: Center(
          child: Text(
            "Book Mark",
            style: TextStyle(fontSize: 20.0),
          ),
        ),
      ),
    );
  }
}
