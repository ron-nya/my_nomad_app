import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_app/features/post/models/post_model.dart';
import 'package:my_app/features/post/repos/post_repo.dart';

class HomeViewModel extends AsyncNotifier<void> {
  late final PostRepository _repository;

  @override
  FutureOr<void> build() {
    _repository = ref.read(postRepo);
  }

  Future<void> deletePost(String postId) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(
      () => _repository.deletePost(postId),
    );
  }
}

final homeProvider =
    AsyncNotifierProvider<HomeViewModel, void>(() => HomeViewModel());

final homeStreamProvider =
    StreamProvider.autoDispose.family<List<PostModel>, String>((ref, userId) {
  final repo = ref.read(postRepo);
  return repo.getPosts(userId);
});
