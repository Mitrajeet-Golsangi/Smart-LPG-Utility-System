import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class SensorReading extends StatelessWidget {
  const SensorReading({
    Key? key,
    required this.isLightTheme,
    required this.header,
    required this.sensorVal,
  }) : super(key: key);
  final bool isLightTheme;
  final String header;
  final int sensorVal;

  @override
  Widget build(BuildContext context) {
    Color progressColor = Colors.green;
    if (sensorVal > 50) {
      progressColor = Colors.green;
    } else if (sensorVal <= 50 && sensorVal >= 20) {
      progressColor = Colors.orange;
    } else if (sensorVal < 20 && sensorVal >= 5) {
      progressColor = Colors.red;
    } else {
      progressColor = Colors.redAccent;
    }
    Color progressTextColor = Colors.green;
    if (sensorVal <= 50 && sensorVal >= 20) {
      progressTextColor = Colors.orange;
    } else if (sensorVal < 20 && sensorVal >= 5) {
      progressTextColor = Colors.red;
    } else if (sensorVal < 5) {
      progressTextColor = Colors.redAccent;
    } else {
      progressTextColor = isLightTheme ? Colors.grey[800]! : Colors.white;
    }
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Text(
              header.toUpperCase(),
              style: TextStyle(color: progressTextColor),
            ),
          ),
          CircularPercentIndicator(
            radius: 80.0,
            lineWidth: 5.0,
            percent: sensorVal / 100,
            center: Text(
              sensorVal.toString() + "%",
            ),
            progressColor: progressColor,
          )
        ],
      ),
    );
  }
}
