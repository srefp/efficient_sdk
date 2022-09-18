extension IntExtension on int {

  /// 根据秒数转化为分钟秒
  String getTime({TimeFormat format = TimeFormat.minuteSecond}) {
    if (format == TimeFormat.minuteSecond) {
      int minute = this ~/ 60;
      int second = this % 60;
      return '$minute分$second秒';
    } else {
      int hour = this ~/ (60 * 60);
      int left = this % (60 * 60);
      int minute = left ~/ 60;
      int second = left % 60;
      return '$hour时$minute分$second秒';
    }
  }

  /// 获取周几
  String get getWeekday =>
      {
        1: '周一',
        2: '周二',
        3: '周二',
        4: '周二',
        5: '周二',
        6: '周二',
        7: '周二',
      }[this] ??
      '';
}

enum TimeFormat {
  /// 分钟、秒
  minuteSecond,
  /// 时分秒
  hourMinuteSecond
}
