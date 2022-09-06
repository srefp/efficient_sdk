import 'dart:io';

class NetUtils {
  /// 打印网卡的所有信息
  static Future printIps() async {
    for (var interface in await NetworkInterface.list()) {
      print('== Interface: ${interface.name} ==');
      for (var addr in interface.addresses) {
        print(
            '${addr.address} ${addr.host} ${addr.isLoopback} ${addr.rawAddress} ${addr.type.name}');
      }
    }
  }

  /// 获取无线网的局域网IP（后续需要完善下网线连接的情况，以太网，Ethernet）
  static Future<String> getIpOfWLANOrEthernet() async {
    if (Platform.isWindows) {
      return await _getIpOnWindows();
    } else if (Platform.isAndroid) {
      return await _getIpOnAndroid();
    } else {
      return '';
    }
  }

  /// 获取windows的IP
  static Future<String> _getIpOnWindows() async {
    late String ip;
    for (var interface in await NetworkInterface.list()) {
      final name = interface.name;
      if (name.contains('WLAN') ||
          name.contains('Ethernet') && !name.contains('vEthernet')) {
        for (var address in interface.addresses) {
          if (address.type.name == 'IPv4') {
            ip = address.address;
          }
        }
      }
    }
    return ip;
  }

  /// 获取Android的IP
  static Future<String> _getIpOnAndroid() async {
    late String ip;
    for (var interface in await NetworkInterface.list()) {
      final name = interface.name;
      if (name.contains('wlan0')) {
        for (var address in interface.addresses) {
          if (address.type.name == 'IPv4') {
            ip = address.address;
          }
        }
      }
    }
    return ip;
  }
}
