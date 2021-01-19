class Feed {
  String uploadedBy;
  String subTitle;
  String profileImage;
  String postImage;
  String captions;
  String discription;
  bool like;
  bool save;
  bool sponsored;
  int commentCount;
  String timeAgo;
  bool sendButton;

  Feed({
    this.uploadedBy,
    this.subTitle,
    this.profileImage,
    this.postImage,
    this.captions,
    this.discription,
    this.like = false,
    this.save = false,
    this.sponsored = false, //if api don't have this value
    this.commentCount = 12,
    this.timeAgo,
    this.sendButton,
  });
}

List<Feed> getFeeds() {
  List<Feed> allFeed = [];

  Feed feed1 = Feed(
    uploadedBy: "TestPerson",
    subTitle: "Admin",
    profileImage:
        "https://i2.wp.com/futureiot.tech/wp-content/themes/jnews-child/avatar.png?ssl=1",
    postImage:
        "https://images.unsplash.com/photo-1601517279624-df15d34c9170?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=750&q=80",
    captions: "This is the caption 1",
    discription: "This is the discription",
    like: false,
    save: false,
    commentCount: 10,
    timeAgo: "2 minutes ago",
    sendButton: false,
  );

  Feed feed2 = Feed(
    uploadedBy: "Test Person 2",
    subTitle: "Admin",
    profileImage:
        "https://www.proquoai.com/hubfs/Daniel%20Sotudeh%20Green%20circular%20avatar.png",
    postImage:
        "https://images.unsplash.com/photo-1481882563558-a1b9f5f7744a?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&auto=format&fit=crop&w=750&q=80",
    captions: "This is caption 2",
    discription: "This is discription",
    like: false,
    save: false,
    commentCount: 5,
    timeAgo: "3 minutes ago",
    sendButton: false,
  );

  Feed feed3 = Feed(
    uploadedBy: "Test Person 2",
    subTitle: "Admin",
    profileImage:
        "https://www.proquoai.com/hubfs/Daniel%20Sotudeh%20Green%20circular%20avatar.png",
    postImage:
        "https://images.unsplash.com/photo-1532274927807-db2758968c3a?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=742&q=80",
    captions: "This is caption 2",
    discription: "This is discription",
    like: false,
    save: false,
    commentCount: 5,
    timeAgo: "1  minutes ago",
    sendButton: false,
  );

  Feed feed4 = Feed(
    uploadedBy: "Test Person 2",
    subTitle: "Admin",
    profileImage:
        "https://www.proquoai.com/hubfs/Daniel%20Sotudeh%20Green%20circular%20avatar.png",
    postImage:
        "https://images.unsplash.com/photo-1481882563558-a1b9f5f7744a?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&auto=format&fit=crop&w=750&q=80",
    captions: "This is caption 2",
    discription: "This is discription",
    like: false,
    save: false,
    commentCount: 5,
    timeAgo: "5 minutes ago",
    sendButton: false,
  );

  allFeed.add(feed1);
  allFeed.add(feed2);
  allFeed.add(feed3);
  allFeed.add(feed4);

  return allFeed;
}
