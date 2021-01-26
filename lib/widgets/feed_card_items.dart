import 'package:flutter/material.dart';
import 'package:bookshelf_app/models/feed.dart';

class PostItem extends StatefulWidget {
  final Feed feed;
  PostItem({this.feed});

  @override
  _PostItemState createState() => _PostItemState();
}

class _PostItemState extends State<PostItem> {
  bool sendButton, save, like;
  int comment;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    like = widget.feed.like; //false
    save = widget.feed.save; //false;
    sendButton = false;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTopPart(),
            _buildImage(context),
            _buildReaction(),
            _buildCaption(),
            _buildCommentSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildTopPart() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 20.0,
                backgroundImage:
                    NetworkImage(widget.feed.uploaderImageUrl ?? ''),
                // ?? yadi null aayo vany provide ""
              ),
              SizedBox(width: 10.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.feed.uploadedBy,
                      style: TextStyle(color: Colors.black)),
                  widget.feed.sponsored
                      ? Text("Sponsored",
                          style: TextStyle(color: Colors.black, fontSize: 10.0))
                      : SizedBox()
                ],
              ),
            ],
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.more_vert, color: Colors.black),
          )
        ],
      ),
    );
  }

  Widget _buildImage(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 300.0,
      child: Image.network(
        widget.feed.imageUrl ?? '',
        // height: 200.0,
        // width: MediaQuery.of(context)
        //     .size
        //     .width, //full width according to the devices screen
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _buildReaction() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Row(
              children: [
                tapIcon(like ? Icons.favorite : Icons.favorite_border,
                    toggleLike, like ? Colors.red : Colors.black),
                SizedBox(width: 20.0),
                tapIcon(Icons.comment, () {}, Colors.black),
                SizedBox(width: 20.0),
                tapIcon(Icons.send, () {}, Colors.black),
              ],
            ),
          ),
          tapIcon(save ? Icons.bookmark : Icons.bookmark_border_outlined,
              toggleSave, Colors.black),
        ],
      ),
    );
  }

  Widget tapIcon(IconData iconData, Function onTap, iconColor) {
    return InkWell(
      onTap: onTap,
      child: Icon(iconData, color: iconColor, size: 28.0),
    );
  }

  toggleLike() {
    setState(() {
      like = !like;
    });
    widget.feed.like = like;
  }

  toggleSave() {
    setState(() {
      save = !save;
    });

    widget.feed.save = save;
  }

  toggleSend() {
    setState(() {
      sendButton = !sendButton;
    });
  }

  _buildCaption() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
            text: TextSpan(
                text: widget.feed.uploadedBy,
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                children: [
                  TextSpan(
                    text: '${widget.feed.caption}',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w300),
                  ),
                ]),
          ),
          SizedBox(
            height: 5.0,
          ),
          // comment != null && comment > 0
          //     ? Text("View all $comment comments",
          //         style: TextStyle(color: Colors.white.withOpacity(0.5)))
          //     : SizedBox(),
        ],
      ),
    );
  }

  _buildCommentSection() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                backgroundImage:
                    NetworkImage(widget.feed.uploaderImageUrl ?? ''),
              ),
              SizedBox(width: 12.0),
              Expanded(
                child: TextField(
                  onChanged: (value) {
                    if (value.isEmpty) {
                      setState(() {
                        sendButton = false;
                      });
                    } else {
                      setState(() {
                        sendButton = true;
                      });
                    }
                  },
                  maxLines: 1,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Add a comment",
                      hintStyle:
                          TextStyle(color: Colors.black.withOpacity(0.4))),
                  style: TextStyle(color: Colors.black),
                ),
              ),
              sendButton
                  ? tapIcon(Icons.send, toggleSend(), Colors.black)
                  : SizedBox(),
            ],
          ),
          Text(
            '${widget.feed.timeAgo}',
            style:
                TextStyle(color: Colors.black.withOpacity(0.5), fontSize: 14.0),
          ),
        ],
      ),
    );
  }
}
