//Done

class Feed {
  String imageUrl;
  String caption;
  String uploadedBy;
  bool like;
  int commentsCount;
  String uploaderImageUrl;
  String timeAgo;
  bool save;
  bool sponsored;
  int postDate;
  String description;
  String uid;

  Feed(
      {this.imageUrl,
      this.caption,
      this.uploadedBy,
      this.like = false,
      this.commentsCount = 3,
      this.uploaderImageUrl,
      this.timeAgo,
      this.save = false,
      this.sponsored = false,
      this.postDate,
      this.description});
}

List<Feed> getFeeds() {
  return [
    Feed(
      imageUrl:
          'https://images.unsplash.com/photo-1601517279624-df15d34c9170?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=750&q=80',
      caption: 'Have a plant at your desk',
      uploadedBy: 'Ramesh Giri',
      like: false,
      commentsCount: 2,
      uploaderImageUrl:
          'https://i2.wp.com/futureiot.tech/wp-content/themes/jnews-child/avatar.png?ssl=1',
      timeAgo: '2 minutes ago',
      save: false,
      sponsored: true,
      postDate: DateTime.now().millisecondsSinceEpoch,
      description:
          'Having a plant at your work desk can be really helpful. I don\'t know why though',
    ),
    Feed(
        imageUrl:
            'https://images.unsplash.com/photo-1481882563558-a1b9f5f7744a?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&auto=format&fit=crop&w=750&q=80',
        caption: 'Eat your breakfast on time',
        uploadedBy: 'Ted Mosby',
        like: false,
        commentsCount: 0,
        uploaderImageUrl:
            'https://www.proquoai.com/hubfs/Daniel%20Sotudeh%20Green%20circular%20avatar.png',
        timeAgo: '2 minutes ago',
        save: false,
        sponsored: false,
        postDate: DateTime.now().millisecondsSinceEpoch,
        description:
            'You should eat your breakfast before 30 minutes, after you wake up.'),
    Feed(
      imageUrl:
          'https://images.unsplash.com/photo-1581250190370-6368e32dbcb5?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=749&q=80',
      caption: 'Have a plant at your desk',
      uploadedBy: 'Barney Stinson',
      like: false,
      commentsCount: 8,
      uploaderImageUrl:
          'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MXwxMjA3fDB8MXxzZWFyY2h8MXx8cGVyc29ufHwwfHx8&ixlib=rb-1.2.1&q=80&w=1080',
      timeAgo: '2 minutes ago',
      save: false,
      sponsored: true,
      postDate: DateTime.now().millisecondsSinceEpoch,
      description:
          'Having a plant at your work desk can be really helpful. I don\'t know why though',
    ),
    Feed(
        imageUrl:
            'https://images.unsplash.com/photo-1599450400952-a65f33138bbf?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=334&q=80',
        caption: 'Eat your breakfast on time',
        uploadedBy: 'Ramesh Giri',
        like: false,
        commentsCount: 2,
        uploaderImageUrl:
            'https://image.shutterstock.com/image-photo/image-260nw-640011838.jpg',
        timeAgo: '2 minutes ago',
        save: false,
        sponsored: true,
        postDate: DateTime.now().millisecondsSinceEpoch,
        description:
            'Y0u should eat your breakfast before 30 minutes, after you wake up.'),
  ];
}
