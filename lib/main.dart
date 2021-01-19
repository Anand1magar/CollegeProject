import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'views/post.dart' as post;
import 'views/careerPath.dart' as path;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: post.Post(),
    );
  }
}
