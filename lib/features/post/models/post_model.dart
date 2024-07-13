class PostModel {
  final String id;
  final String authorId;
  final String content;
  final String mood;
  final DateTime createDttm;

  PostModel({
    required this.id,
    required this.authorId,
    required this.content,
    required this.mood,
    required this.createDttm,
  });

  PostModel.fromJson(Map<String, dynamic> json)
      : id = json['id'] ?? '0',
        authorId = json['authorId'],
        content = json['content'],
        mood = json['mood'],
        createDttm = DateTime.parse(json['createDttm'].toString());

  Map<String, String> toJson() {
    return {
      "id": id,
      "authorId": authorId,
      "content": content,
      "mood": mood,
      "createDttm": createDttm.toString(),
    };
  }
}
