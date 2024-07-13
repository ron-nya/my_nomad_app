import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_app/features/post/models/post_model.dart';
import 'package:my_app/features/post/repos/post_repo.dart';

class PostViewModel extends AsyncNotifier<void> {
  late final PostRepository _repository;

  @override
  FutureOr<void> build() {
    _repository = ref.read(postRepo);
  }

  Future<void> uploadPost(PostModel post) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(
      () => _repository.addPost(post),
    );
  }
}

final postProvider =
    AsyncNotifierProvider<PostViewModel, void>(() => PostViewModel());
