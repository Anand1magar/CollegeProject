import 'dart:async';

import 'package:day_night_switcher/day_night_switcher.dart';
import 'package:flutter/material.dart';

class TextPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: bloc.darkThemeEnabled,
      initialData: false,
      builder: (context, snapshot) => MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: snapshot.data ? ThemeData.dark() : ThemeData.light(),
          home: HomePage(snapshot.data)),
    );
  }
}

class HomePage extends StatelessWidget {
  final bool darkThemeEnabled;

  HomePage(this.darkThemeEnabled);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Multimedia"),
        actions: [
          DayNightSwitcher(
            isDarkModeEnabled: darkThemeEnabled,
            onStateChanged: bloc.changeTheme,
          ),
        ],
      ),
      body: ListView(children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            title("Multimedia:"),
            discribe(
                "The term multimedia is form combining two words multi which means many and media which is a way to deliver a message. multimedia is the combination of many media such as text, audio, image, video and animation to deliver the messages. "),
            title("Animation"),
            discribe(
                "It plays an important role while preparing multimedia content. Animation is used to make the content attractive which help to make the content realistic in nature. It is used to add effect transition to the object"),
            title("Multimedia system"),
            discribe(
                "A multimedia system is characterized by computer control integration product on, manipulation, presentation storage and communication of independent information which is encoded at least through a continuous time dependent) and a discrete (time independent) medium. "),
            title("Medium(media):"),
            discribe(
                "Medium can be defined as an intervening substance through which something is to be transmitted or carried any other means for distribution and presentation of information. It can be classified and explained as:"),
          ],
        ),
      ]),
    );
  }
}

Widget title(String title) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Text(
      title,
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0),
    ),
  );
}

Widget discribe(String discribe) {
  return Column(
    children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          discribe,
          style: TextStyle(fontSize: 20.0),
        ),
      ),
      SizedBox(
        height: 20,
      ),
    ],
  );
}

class Bloc {
  final _themeController = StreamController<bool>();
  get changeTheme => _themeController.sink.add;
  get darkThemeEnabled => _themeController.stream;
}

final bloc = Bloc();

//  value: darkThemeEnabled,
//             onChanged: bloc.changeTheme,
