extension RegExtension on RegExp {
  /// 匹配单个
  String matchOne(String input) {
    final firstMatch = this.firstMatch(input);
    return firstMatch?.group(1) ?? '';
  }

}