extension StringListExtension on List<String> {
  String get toCommaString {
    StringBuffer buffer = StringBuffer();
    for (var i = 0; i < length; i++) {
      buffer.write('\'${this[i]}\'');
      if (i != length - 1) {
        buffer.write(',');
      }
    }
    return buffer.toString();
  }
}