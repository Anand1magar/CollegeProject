import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'views/introPage.dart' as intro;
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(ProviderScope(child: MyApp()));
  //after wraping ProviderScope in MyApp now we can access anywhere we want
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
      home: intro.IntroPage(),
    );
  }
}
