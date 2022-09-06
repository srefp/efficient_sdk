import 'dart:convert';

import 'package:convert/convert.dart';
import 'package:dart_des/dart_des.dart';

class DesUtils {
  /// 第一版密钥
  final DES _desECB = DES(key: "36852689".codeUnits, mode: DESMode.ECB);

  String encrypt(String message) {
    List<int> encrypted = _desECB.encrypt(message.codeUnits);
    return hex.encode(encrypted);
  }

  String decrypt(String message) {
    List<int> decrypted = _desECB.decrypt(hex.decode(message));
    return utf8.decode(decrypted);
  }
}
