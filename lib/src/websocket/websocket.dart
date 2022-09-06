import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/status.dart' as status;

/// 建立WebSocket连接
connectWebSocket(String url) {
  var channel = IOWebSocketChannel.connect(Uri.parse(url));

  channel.stream.listen((message) {
    channel.sink.add('received!');
    channel.sink.close(status.goingAway);
  });
}