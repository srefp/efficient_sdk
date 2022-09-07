import 'package:flutter/material.dart';
import 'package:lpinyin/lpinyin.dart';

/// String扩展类
extension StringExtension on String {
  /// 获取拼音
  String get pinyinFirstLetter =>
      PinyinHelper.getFirstWordPinyin(this)[0].toUpperCase();

  /// 判断为空或者为空字符串
  bool get isBlank {
    if (trim() == '') {
      return true;
    }
    return false;
  }

  /// 首字母小写
  String get firstToLower => isNotEmpty
      ? replaceFirst(characters.first, characters.first.toLowerCase())
      : '';

  /// 首字母大写
  String get firstToUpper => isNotEmpty
      ? replaceFirst(characters.first, characters.first.toUpperCase())
      : '';

  /// 下划线转驼峰
  String get underLineToCamel {
    int pos;
    String res = this;
    while ((pos = res.indexOf('_')) != -1) {
      res = res.replaceRange(
        pos,
        pos + 2,
        res.characters.characterAt(pos + 1).toUpperCase().toString(),
      );
    }
    return res;
  }

  String get javaType {
    final map = {
      'datetime': 'Date',
      'time': 'Date',
      'date': 'Date',
      'timestamp': 'Date',
      'tinyint': 'Integer',
      'smallint': 'Integer',
      'mediumint': 'Integer',
      'int': 'Integer',
      'number': 'Integer',
      'integer': 'Integer',
      'bit': 'Integer',
      'bigint': 'Long',
      'float': 'Double',
      'double': 'Double',
      'real': 'Double',
      'decimal': 'BigDecimal',
    };
    return map[this] ?? 'String';
  }

  String get dartType {
    final map = {
      'datetime': 'DateTime',
      'time': 'DateTime',
      'date': 'DateTime',
      'timestamp': 'DateTime',
      'tinyint': 'int',
      'smallint': 'int',
      'mediumint': 'int',
      'int': 'int',
      'number': 'int',
      'integer': 'int',
      'bit': 'int',
      'bigint': 'int',
      'float': 'double',
      'double': 'double',
      'real': 'double',
      'decimal': 'double',
    };
    return map[this] ?? 'String';
  }

  String get goType {
    final map = {
      'datetime': 'int64',
      'time': 'int64',
      'date': 'int64',
      'timestamp': 'int64',
      'tinyint': 'int',
      'smallint': 'int',
      'mediumint': 'int',
      'int': 'int',
      'number': 'int',
      'integer': 'int',
      'bit': 'int',
      'bigint': 'int',
      'float': 'double',
      'double': 'double',
      'real': 'double',
      'decimal': 'double',
    };
    return map[this] ?? 'string';
  }

  String get sqliteJavaType {
    final map = {
      'integer': 'Integer',
      'real': 'Double',
    };
    return map[this] ?? 'String';
  }

  String get sqliteDartType {
    final map = {
      'integer': 'int',
      'real': 'double',
    };
    return map[this] ?? 'String';
  }

  String get sqliteGoType {
    final map = {
      'integer': 'int',
      'real': 'double',
    };
    return map[this] ?? 'string';
  }

  String get convertFileSeparator => replaceAll('\\', '/');
}
