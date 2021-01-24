import 'package:bookshelf_app/models/feed.dart';
import 'package:bookshelf_app/state/feed_state.dart';
import 'package:flutter/material.dart';
import 'package:bookshelf_app/service/post_services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//Done
class AddPost extends StatefulWidget {
  @override
  _AddPostState createState() => _AddPostState();
}

class _AddPostState extends State<AddPost> {
  GlobalKey<FormState> _formKey = GlobalKey();
  bool isLoading = false;
  Feed feed;

  @override
  void initState() {
    super.initState();
    feed = Feed(); //Creating new feed
  }

  onPostAdd() async {
    if (_formKey.currentState.validate()) {
      // It will run all the validator() which is used in all TextFormField
      print("Data validate");
      _formKey.currentState.save();
      //it will run all the onSaved() inside TextFormField
      var feedProvider = context.read(addFeedProvider);
      await feedProvider.addFeed(feed);

      if (feedProvider.error != null) {
        //show error
      } else {
        Navigator.pop(context);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: Text("Add New Post"),
        ),
        body: Form(
          //if u r using TextFormField we need Form
          key: _formKey, //it provide overall control from all TextFormField
          //it can also validate all TextFormField  at a time

          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
            children: [
              Text(
                'Image Url',
                style: TextStyle(color: Colors.white),
              ),
              TextFormField(
                onSaved: (value) => feed.imageUrl = value,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'This field cannot be empty';
                  } else {
                    return null;
                  }
                },
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: "Add Image Url",
                  hintStyle: TextStyle(color: Colors.grey),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                'Caption',
                style: TextStyle(color: Colors.white),
              ),
              TextFormField(
                onSaved: (value) => feed.caption = value,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'This field cannot be empty';
                  } else {
                    return null;
                  }
                },
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: "Caption",
                  hintStyle: TextStyle(color: Colors.grey),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                'Description',
                style: TextStyle(color: Colors.white),
              ),
              TextFormField(
                onSaved: (value) => feed.description = value,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'This field cannot be empty';
                  } else {
                    return null;
                  }
                },
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: "Description here",
                  hintStyle: TextStyle(color: Colors.grey),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Center(child: Consumer(
                builder: (context, watch, child) {
                  var isLoading = watch(addFeedProvider).isLoading;
                  return isLoading
                      ? CircularProgressIndicator()
                      : RaisedButton(
                          onPressed: this.onPostAdd,
                          color: Colors.green,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: Text('Save'),
                        );
                },
              ))
            ],
          ),
        ));
  }
}
