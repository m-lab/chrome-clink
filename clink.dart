library clink;

import 'dart:async';
import 'dart:html';
import 'package:web_ui/watcher.dart' as watchers;
import 'socket.dart';
import 'mlab.dart' as mlab;

void start() {
  mlab.lookup('ndt').then((response) {
      String ip = response["ip"][0];
      print('Testing against $ip\n');  
      // See clink-loop
  });
}

String currentTime;
void main() {
  var timer = new Timer.periodic(const Duration(seconds: 1), (t) {
      DateTime today = new DateTime.now();
      currentTime = formatTime(today.hour, today.minute, today.second);
      watchers.dispatch();
  });
}

String formatTime(int h, int m, int s) {
  String hour = (h <= 9) ? '0$h' : '$h';
  String minute = (m <= 9) ? '0$m' : '$m';
  String second = (s <= 9) ? '0$s' : '$s';
  return '$hour:$minute:$second';
}

