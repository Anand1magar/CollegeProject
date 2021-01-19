import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'home.dart' as home;
import 'noteBook.dart' as noteBook;
import 'login_page.dart' as signin;
import 'LiveChat.dart' as chat;
import 'bookMark.dart' as bookMark;
import 'post.dart' as post;

class BottomNavScreen extends StatefulWidget {
  @override
  _BottomNavScreenState createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  //It will direct communicate with firebase

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  final List screens = [
    home.MyHomePage(),
    post.Post(),
    noteBook.NoteBook(),
    chat.LiveChat(),
    bookMark.BookMark(),
  ];
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        index: 0,
        height: 50.0,
        items: <Widget>[
          Icon(Icons.home, size: 30, color: Colors.white),
          Icon(Icons.post_add, size: 30, color: Colors.white),
          Icon(Icons.note, size: 30, color: Colors.white),
          Icon(Icons.chat, size: 30, color: Colors.white),
          Icon(Icons.bookmark, size: 30, color: Colors.white),
        ],
        color: Colors.blueAccent,
        buttonBackgroundColor: Colors.blueAccent,
        backgroundColor: Colors.transparent,
        animationCurve: Curves.easeInOut,
        animationDuration: Duration(milliseconds: 300),
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
      body: screens[_currentIndex],
    );
  }
}
