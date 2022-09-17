extension IntExtension on int {
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
