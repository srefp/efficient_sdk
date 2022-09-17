import 'package:date_format/date_format.dart';

/// 日期工具

/// 获取今天时间 [yyyy-MM-dd HH:mm:ss]
String getTodayString() {
  return formatDate(
      DateTime.now(), [yyyy, '-', mm, '-', dd, ' ', HH, ':', nn, ':', ss]);
}

/// 获取今天月份
int getMonth() {
  return DateTime.now().month;
}

/// 获取本周的周一日期
DateTime getMonDayDateOfCurrentWeek() {
  final now = DateTime.now();
  return now.subtract(Duration(days: now.weekday - 1));
}

/// 获取今天日期 [yyyy/MM/dd]
String getTodayDateString() {
  return formatDate(
      DateTime.now(), [yyyy, '/', m, '/', dd]);
}


/// 计算日期
SpecialDay calDate(DateTime dateTime) {
  return SpecialDay.none;
}

enum SpecialDay {
  /// 今天
  today,

  /// 明天
  tomorrow,

  /// 昨天
  yesterday,

  /// 前天
  theDayBeforeYesterday,

  /// 不是特殊日期
  none
}
