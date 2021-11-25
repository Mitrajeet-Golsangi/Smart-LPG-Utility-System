import 'package:lpg_gas_monitoring/src/constants/sensor_constants.dart';

class SensorModel {
  final double forceValPercent;
  final double gasValPercent;
  final double forceVal;
  final double gasVal;
  final String statusCode;

  SensorModel(
      this.forceValPercent, this.gasValPercent, this.forceVal, this.gasVal,
      {this.statusCode = "200"});

  factory SensorModel.fromJson(json) {
    if (json['error'] != null) {
      return SensorModel(0, 0, 0, 0, statusCode: json['error']);
    } else {
      try {
        return SensorModel(
          json[SensorConstants.percentagePath][SensorConstants.forceData]
              .toDouble(),
          json[SensorConstants.percentagePath][SensorConstants.gasData]
              .toDouble(),
          json[SensorConstants.valuePath][SensorConstants.forceData].toDouble(),
          json[SensorConstants.valuePath][SensorConstants.gasData].toDouble(),
        );
      } on NoSuchMethodError {
        return SensorModel(0, 0, 0, 0, statusCode: "NoSuchMethodError");
      }
    }
  }
}
