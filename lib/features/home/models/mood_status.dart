enum Mood {
  funny,
  love,
  happy,
  enjoy,
  sad,
  angry,
  tired,
  bad,
}

class MoodStatus {
  static const Map<Mood, String> moodEmojis = {
    Mood.funny: "\u{1F601}",
    Mood.love: "\u{1F60D}",
    Mood.happy: "\u{1F60A}",
    Mood.enjoy: "\u{1F606}",
    Mood.sad: "\u{1F62D}",
    Mood.angry: "\u{1F621}",
    Mood.tired: "\u{1F632}",
    Mood.bad: "\u{1F623}",
  };

  static String getMoodEmoji(String moodValue) {
    print(moodValue);
    Mood mood = Mood.values.firstWhere(
      (e) => e.toString().split('.').last == moodValue,
      orElse: () => Mood.happy,
    );

    return moodEmojis[mood] ?? moodEmojis[Mood.happy]!;
  }
}
