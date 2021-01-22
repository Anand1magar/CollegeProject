import 'package:bookshelf_app/models/feed.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class PostServices {
  static FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  static Future<DocumentReference> addPost(Feed feed) {
    CollectionReference _feedReference = _firebaseFirestore.collection("feed");
    var data = {
      'name': feed.uploadedBy,
      'age': feed.postImage,
      'discription': feed.discription,
      'caption': feed.captions,
    };
    return _feedReference.add(data);
  }
}
