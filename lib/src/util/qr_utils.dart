import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

extension QrUtils on String {
  /// 获取二维码
  Widget get qrCode {
    return QrImage(
      data: this,
      version: QrVersions.auto,
      size: 200,
    );
  }
}
