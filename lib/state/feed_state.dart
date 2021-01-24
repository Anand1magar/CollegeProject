import 'package:bookshelf_app/models/feed.dart';
import 'package:bookshelf_app/service/post_services.dart';
import 'package:bookshelf_app/state/auth_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//Done
final isFeedSavingProvider = StateProvider<bool>((ref) => false);
final addFeedProvider =
    ChangeNotifierProvider<AddFeedNotifier>((ref) => AddFeedNotifier(ref));

class AddFeedNotifier extends ChangeNotifier {
  bool isLoading = false;
  String error;
  ProviderReference ref;
  AddFeedNotifier(this.ref);

  addFeed(Feed feed) async {
    try {
      this.isLoading = true;
      notifyListeners();
      feed.postDate = DateTime.now().millisecondsSinceEpoch;
      feed.uploadedBy = ref.read(userProvider).state.displayName;
      feed.uid = ref.read(userProvider).state.uid;
      await PostServices.addPost(feed);
    } catch (error) {
      this.error = error.toString();
    } finally {
      this.isLoading = false;
      notifyListeners();
    }
  }
}
