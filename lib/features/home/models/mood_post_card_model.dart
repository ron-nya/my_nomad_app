class MoodPostCardModel {
  final String autherId;
  final DateTime createDttm;
  final String mood;
  final String content;

  MoodPostCardModel({
    required this.autherId,
    required this.createDttm,
    required this.mood,
    required this.content,
  });
}
