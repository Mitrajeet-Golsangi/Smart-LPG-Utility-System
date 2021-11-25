import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lpg_gas_monitoring/src/constants/sensor_constants.dart';
import 'package:oscilloscope/oscilloscope.dart';

class SensorGraph extends StatefulWidget {
  const SensorGraph(
      {Key? key,
      required this.isLightTheme,
      required this.graphColor,
      required this.sensorName,
      required this.sensorVal,
      this.cancelTimer = false})
      : super(key: key);

  final bool isLightTheme;
  final Color graphColor;
  final String sensorName;
  final double sensorVal;
  final bool cancelTimer;
  @override
  _SensorGraphState createState() => _SensorGraphState();
}

class _SensorGraphState extends State<SensorGraph> {
  List<double> traceSensor = [];
  Timer? _timer;
  @override
  initState() {
    super.initState();

    _timer = Timer.periodic(
        const Duration(milliseconds: SensorConstants.timerDelay), (timer) {
      setState(() {
        traceSensor.add(widget.sensorVal);
      });
    });
  }

  @override
  void dispose() {
    _timer!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Oscilloscope scopeOne = Oscilloscope(
      showYAxis: true,
      yAxisColor: widget.graphColor,
      margin: const EdgeInsets.all(20.0),
      strokeWidth: 1.0,
      traceColor: widget.graphColor,
      backgroundColor:
          widget.isLightTheme ? Colors.grey[300]! : Colors.grey[700]!,
      yAxisMax: 1000,
      yAxisMin: 0,
      dataSet: traceSensor,
    );
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Text(widget.sensorName + " Sensor"),
          SizedBox(
            height: 150,
            child: scopeOne,
          )
        ],
      ),
    );
  }
}
