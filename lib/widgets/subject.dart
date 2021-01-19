import 'package:bookshelf_app/views/TextPage.dart';
import 'package:flutter/material.dart';

class Subject extends StatelessWidget {
  final String title;

  const Subject({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        right: 9.0,
        top: 10.0,
        bottom: 30.0,
      ),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => TextPage()));
        },
        child: Container(
          padding: EdgeInsets.all(4.0),
          width: 160.0,
          height: 70.0,
          child: Center(
              child: Text(
            "$title",
            style: TextStyle(fontSize: 18.0, color: Colors.white),
          )),
          decoration: BoxDecoration(
            color: Color(0xff9174F2),
            borderRadius: BorderRadius.circular(15),
          ),
        ),
      ),
    );
  }
}
