import 'package:bookshelf_app/models/feed.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

//Done
class PostServices {
  static FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  static Future<DocumentReference> addPost(Feed feed) {
    CollectionReference _feedReference = _firebaseFirestore.collection("feed");
    var data = {
      'name': feed.uploadedBy,
      'imageUrl': feed.imageUrl,
      'description': feed.description,
      'caption': feed.caption,
      'postDate': feed.postDate,
      'uid': feed.uid
    };
    return _feedReference.add(data);
  }
}
