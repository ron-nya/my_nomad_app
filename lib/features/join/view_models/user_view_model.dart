import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_app/features/join/models/user_model.dart';
import 'package:my_app/features/join/repos/authentication_repo.dart';
import 'package:my_app/features/join/repos/user_repo.dart';

class UsersViewModel extends AsyncNotifier<UserModel> {
  late final UserRepository _userRepository;
  late final AuthenticationRepository _authRepository;

  @override
  FutureOr<UserModel> build() {
    _userRepository = ref.read(userRepo);
    _authRepository = ref.read(authRepo);
    return UserModel.empty();
  }

  Future<void> createProfile(UserCredential credential) async {
    if (credential.user == null) {
      throw Exception("Account not created");
    }
    state = const AsyncValue.loading();
    final profile = UserModel(
      email: credential.user!.email ?? "anonymous@anonymous.com",
      uid: credential.user!.uid,
    );
    await _userRepository.createProfile(profile);
    state = AsyncValue.data(profile);
  }

  String getUserUid() {
    return _authRepository.user!.uid.toString();
  }
}

final usersProvider = AsyncNotifierProvider<UsersViewModel, UserModel>(
  () => UsersViewModel(),
);
