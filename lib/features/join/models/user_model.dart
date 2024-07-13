class UserModel {
  final String uid;
  final String email;

  UserModel({
    required this.uid,
    required this.email,
  });

  UserModel.empty()
      : uid = "",
        email = "";

  Map<String, String> toJson() {
    return {
      "uid": uid,
      "email": email,
    };
  }
}
