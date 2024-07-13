class AppDateUtil {
  static Duration getTimeDiffrence(DateTime datetime) {
    return DateTime.now().difference(datetime);
  }

  static String getFormattedTimeDiffrence(DateTime datetime) {
    Duration timeDiff = getTimeDiffrence(datetime);
    int days = timeDiff.inDays;
    int hours = timeDiff.inHours % 24;
    int minutes = timeDiff.inMinutes % 60;
    int seconds = timeDiff.inSeconds % 60;

    if (days > 0) {
      return '${days}d ago';
    } else if (hours > 0) {
      return '${hours}h ${minutes}m ago';
    } else if (minutes > 0) {
      return '${minutes}m ago';
    } else {
      return '${seconds}s ago';
    }
  }
}
