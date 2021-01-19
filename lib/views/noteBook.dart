import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'tabs/first.dart' as first;
import 'tabs/second.dart' as second;
import 'tabs/thrid.dart' as third;
import 'tabs/fourth.dart' as fourth;
import 'tabs/fifth.dart' as fifth;
import 'tabs/sixth.dart' as sixth;

void main() {
  runApp(NoteBook());
}

class NoteBook extends StatefulWidget {
  @override
  _NoteBookState createState() => _NoteBookState();
}

class _NoteBookState extends State<NoteBook> with TickerProviderStateMixin {
  TabController controller; //syncronize between tababr and TabBarView Pages
  int currentIndex = 0;
  Widget tabs(String title) {
    return Tab(
      child: Container(
        child: Align(
          alignment: Alignment.center,
          child: Text("$title"),
        ),
        // decoration: BoxDecoration(
        //   borderRadius: BorderRadius.circular(50),
        //   border: Border.all(
        //     color: Colors.redAccent,
        //     width: 1,
        //   ),
        // ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Flutter tab bar",
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primaryColor: Colors.blue),
        home: DefaultTabController(
          length: 5,
          child: Scaffold(
            appBar: AppBar(
              actions: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    backgroundImage: AssetImage("assets/userid.jpg"),
                  ),
                )
              ],
              elevation: 1,
              title: Text(
                "Note Book",
                style: TextStyle(
                  color: Color(0xff7D9AEA),
                  fontSize: 25.0,
                ),
              ),
              backgroundColor: Colors.white,
              bottom: TabBar(
                  onTap: (index) {
                    setState(() {
                      currentIndex = index;
                    });
                  },
                  isScrollable: true,
                  unselectedLabelColor: Color(0xff9073F1),
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    // color: Colors.redAccent,
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment(0.8,
                          0.0), // 10% of the width, so there are ten blinds.
                      colors: [Color(0xffE17AC1), Color(0xff9073F1)],
                      tileMode: TileMode.clamp,
                    ),
                  ),
                  controller: controller,
                  tabs: [
                    tabs("DCOM"),
                    tabs("BSCIT"),
                    tabs("BIT"),
                    tabs("BE"),
                    tabs("Btech"),
                  ]),
            ),
            body: TabBarView(controller: controller, children: [
              second.Second(),
              third.Thrid(),
              fourth.Fourth(),
              fifth.Fifth(),
              sixth.Sixth(),
            ]),
          ),
        ));
  }
}
