import 'package:bookshelf_app/views/add_post_screen.dart';
import 'package:flutter/material.dart';
import 'package:bookshelf_app/widgets/feed_card_items.dart';
import 'package:bookshelf_app/models/feed.dart';

class Post extends StatefulWidget {
  @override
  _PostState createState() => _PostState();
}

class _PostState extends State<Post> {
  var itemList;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    itemList = getFeeds();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          //async => certain area or part will update when data came
          var feedItem = await Navigator.push(
              context, MaterialPageRoute(builder: (_) => AddPost()));
          //AddPost() lay j data falxa that will be stored in  newFeed Variable
          print(
              "await keyword wait for the promissing value and then this line will execuated");
          setState(() {
            itemList.add(feedItem);
          });
          print(
              "Checked data is stored or not in newFeed : ${feedItem.uploadedBy}"); //
          // print("This print will not run because await wait for data to come in newFeed");
        },
        child: Icon(Icons.add),
      ),
      backgroundColor: Colors.black,
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundImage: AssetImage("assets/userid.jpg"),
            ),
          )
        ],
        title: Text("Post",
            style: TextStyle(
              color: Color(0xff7D9AEA),
              fontSize: 25.0,
            )),
        elevation: 1,
        backgroundColor: Colors.white,
      ),
      body: ListView.builder(
        itemCount: itemList.length, //4
        itemBuilder: (context, index) {
          return PostItem(
            feed: itemList[index],
          );
        },
        padding: EdgeInsets.only(top: 10),
      ),
    );
  }
}
