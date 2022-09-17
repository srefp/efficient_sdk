import 'package:date_format/date_format.dart';

extension DateTimeFormat on DateTime {
  /// 获取日期时间 [yyyy-MM-dd HH:mm:ss]
  String get dateTimeString => formatDate(
        this,
        [yyyy, '-', mm, '-', dd, ' ', HH, ':', nn, ':', ss],
      );

  /// 获取月日
  String get monthDayString => formatDate(this, [mm, '/', dd]);

  /// 获取日期 [yyyy/M/d]
  String get dateString => formatDate(
        this,
        [yyyy, '/', m, '/', d],
      );

  /// 获取时间 [HH:mm:ss]
  String get timeString => formatDate(
        this,
        [HH, ':', nn, ':', ss],
      );

  /// 获取日期时间
  String dateTimeStr({
    List<String> formats = const [
      yyyy,
      '-',
      mm,
      '-',
      dd,
      ' ',
      HH,
      ':',
      nn,
      ':',
      ss
    ],
  }) {
    return formatDate(this, formats);
  }

  /// 获取日期
  String dateStr({
    List<String> formats = const [yyyy, '-', mm, '-', dd],
  }) {
    return formatDate(this, formats);
  }

  /// 获取时间
  String timeStr({
    List<String> formats = const [HH, ':', nn, ':', ss],
  }) {
    return formatDate(this, formats);
  }
}
