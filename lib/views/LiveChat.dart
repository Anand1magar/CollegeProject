import 'package:flutter/material.dart';
import 'chat_screen.dart';

class LiveChat extends StatefulWidget {
  @override
  _LiveChatState createState() => _LiveChatState();
}

class _LiveChatState extends State<LiveChat> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              block(context, "General", Color(0xff1B8FFC), Color(0xff58C2F8),
                  Color(0xff58C2F8)),
              block(context, "General", Color(0xffEE5C2C), Color(0xffFFA22E),
                  Color(0xffFFA22E)),
              block(context, "General", Color(0xffEF2F7E), Color(0xffFE79B5),
                  Color(0xffFE79B5)),
              block(context, "General", Color(0xffFFF8B1B), Color(0xffFFCD1B),
                  Color(0xffFFCD1B)),
              block(context, "General", Color(0xff7186EE), Color(0xffA5B1FF),
                  Color(0xffA5B1FF)),
              block(context, "General", Color(0xffF751A0), Color(0xffFF9597),
                  Color(0xffFF9597)),
            ],
          ),
        ),
      ),
    );
  }
}

Widget block(context, String title, Color color1, Color color2, Color shadow) {
  return InkWell(
    onTap: () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => ChatScreen()));
    },
    child: Padding(
      padding: const EdgeInsets.all(14.0),
      child: Container(
        height: 94.0,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Row(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "$title",
                    style: TextStyle(fontSize: 27.0, color: Colors.white),
                  ),
                  Text(
                    "This is the discription of this tile",
                    style: TextStyle(fontSize: 17.0, color: Colors.white),
                  ),
                ],
              ),
              SizedBox(
                width: 25,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "...",
                    style: TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "2",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  Text("message", style: TextStyle(color: Colors.white)),
                ],
              )
            ],
          ),
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            color1, //0xff73A1F9
            color2, //0xff6DC8F3
          ], begin: Alignment.topLeft, end: Alignment.bottomRight),
          boxShadow: [
            BoxShadow(
              color: shadow,
              blurRadius: 12,
              offset: Offset(0, 6),
            ),
          ],
          borderRadius: BorderRadius.circular(15.0),
        ),
      ),
    ),
  );
}
