import 'dart:convert';

import 'package:lpg_gas_monitoring/src/data/dataproviders/sensor_api.dart';
import 'package:lpg_gas_monitoring/src/data/models/sensor_model.dart';

class SensorRespository {
  final SensorAPI api = SensorAPI();

  Future<SensorModel> getSensorData() async {
    final String jsonData = await api.getSensorReading();
    SensorModel sensorModel = SensorModel.fromJson(json.decode(jsonData));
    return sensorModel;
  }
}
