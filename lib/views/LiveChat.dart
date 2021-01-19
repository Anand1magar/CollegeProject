import 'package:flutter/material.dart';

class LiveChat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Live Chat"),
      ),
      body: Container(
        child: Center(
          child: Text(
            "Live chat",
            style: TextStyle(fontSize: 20.0),
          ),
        ),
      ),
    );
  }
}
