import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_app/features/join/repos/authentication_repo.dart';
import 'package:my_app/features/join/view_models/user_view_model.dart';

class JoinViewModel extends AsyncNotifier<void> {
  late final AuthenticationRepository _authRepo;

  @override
  FutureOr<void> build() {
    _authRepo = ref.read(authRepo);
  }

  Future<void> join() async {
    state = const AsyncValue.loading();

    final form = ref.read(joinForm);
    final user = ref.read(usersProvider.notifier);
    state = await AsyncValue.guard(() async {
      final userCredential = await _authRepo.join(
        form["email"],
        form["password"],
      );
      await user.createProfile(userCredential);
    });
  }
}

final joinForm = StateProvider((ref) => {});

final joinProvider = AsyncNotifierProvider<JoinViewModel, void>(
  () => JoinViewModel(),
);
