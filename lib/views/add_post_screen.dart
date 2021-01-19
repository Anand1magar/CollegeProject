import 'package:bookshelf_app/models/feed.dart';
import 'package:flutter/material.dart';

class AddPost extends StatefulWidget {
  @override
  _AddPostState createState() => _AddPostState();
}

class _AddPostState extends State<AddPost> {
  GlobalKey<FormState> _formKey = GlobalKey();
  Feed feed;

  @override
  void initState() {
    super.initState();
    feed = Feed(); //Creating new feed
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
                "Full name",
                style: TextStyle(color: Colors.white, fontSize: 16.0),
              ),
              TextFormField(
                onSaved: (value) => feed.uploadedBy = value,
                validator: (value) {
                  if (value.isEmpty) {
                    return "Please enter your name";
                  } else {
                    return null;
                  }
                },
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: "Enter your full name",
                  hintStyle: TextStyle(color: Colors.grey),
                ),
              ),
              SizedBox(height: 10.0),
              Text(
                "Caption",
                style: TextStyle(color: Colors.white, fontSize: 16.0),
              ),
              TextFormField(
                onSaved: (value) => feed.captions = value,
                validator: (value) {
                  if (value.isEmpty) {
                    return "Please enter your caption";
                  } else {
                    return null;
                  }
                },
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: "Enter the caption",
                  hintStyle: TextStyle(color: Colors.grey),
                ),
              ),
              SizedBox(height: 10.0),
              Text(
                "Discription",
                style: TextStyle(color: Colors.white, fontSize: 16.0),
              ),
              TextFormField(
                onSaved: (value) => feed.discription = value,
                validator: (value) {
                  if (value.isEmpty) {
                    return "Please enter your discription";
                  } else {
                    return null;
                  }
                },
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: "Enter the Discription",
                  hintStyle: TextStyle(color: Colors.grey),
                ),
              ),
              SizedBox(height: 10.0),
              Text(
                "Image  URL",
                style: TextStyle(color: Colors.white, fontSize: 16.0),
              ),
              TextFormField(
                onSaved: (value) => feed.postImage = value,
                validator: (value) {
                  if (value.isEmpty) {
                    return "Please enter your name";
                  } else {
                    return null;
                  }
                },
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: "Enter the image URL",
                  hintStyle: TextStyle(color: Colors.grey),
                ),
              ),
              SizedBox(
                height: 35,
              ),
              RaisedButton(
                padding: EdgeInsets.symmetric(vertical: 15.0),
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    // It will run all the validator() which is used in all TextFormField
                    print("Data validate");

                    _formKey.currentState.save();
                    //it will run all the onSaved() inside TextFormField

                    Navigator.pop(context,
                        feed); //Context ,feed are the value which is send to previous screen
                  }
                },
                color: Colors.blue,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0)),
                child: Text(
                  "Save",
                  style: TextStyle(color: Colors.white),
                ),
              )
            ],
          ),
        ));
  }
}
