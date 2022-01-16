import 'dart:async';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:lpg_gas_monitoring/src/constants/sensor_constants.dart';

class SensorAPI {
  static const protocol = 'http';
  static String host = '192.168.29.155';
  static String port = '0000';

  static Uri constructURI(String host, String port) {
    final Uri url;
    if (port != '0000') {
      url = Uri.parse("$protocol://$host:$port/${SensorConstants.path}");
    } else {
      url = Uri.parse("$protocol://$host/data");
    }
    print("$protocol://$host/${SensorConstants.path}");
    return url;
  }

  Future<String> getSensorReading() async {
    Uri url = constructURI(host, port);
    print("Request Made");
    try {
      http.Response response = await http
          .get(url)
          .timeout(const Duration(milliseconds: SensorConstants.timerDelay),
              onTimeout: () {
        return http.Response("error", 500);
      });
      if (response.statusCode == 200) {
        print(response.body);
        return response.body;
      } else {
        return '{"error": "${response.statusCode}"}';
      }
    } on http.ClientException catch (error) {
      return '{"error" : "$error"}';
    } on SocketException {
      return '{"error": "Connection Lost"}';
    } on OSError {
      return '{"error": "Connection Reset"}';
    } on TimeoutException {
      return '{"error": "Connection Timed Out"}';
    }
  }
}
