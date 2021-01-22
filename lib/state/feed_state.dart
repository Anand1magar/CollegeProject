import 'package:bookshelf_app/models/feed.dart';
import 'package:bookshelf_app/service/post_services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final isFeedSavingProvider = StateProvider<bool>((ref) => false);
final addFeedProvider =
    ChangeNotifierProvider<AddFeedNotifier>((ref) => AddFeedNotifier());

class AddFeedNotifier extends ChangeNotifier {
  bool isLoading = false;
  String error;
  addField(Feed feed) {
    try {
      PostServices.addPost(feed);
    } catch (e) {
      this.error = e.toString();
    } finally {
      this.isLoading = false;
    }
  }
}
