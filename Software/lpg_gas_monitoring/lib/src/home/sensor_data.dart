import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:lpg_gas_monitoring/src/components/error_message.dart';
import 'package:lpg_gas_monitoring/src/components/sensor_reading.dart';
import 'package:lpg_gas_monitoring/src/home/cubit/sensor_readings_cubit.dart';

class SensorData extends StatefulWidget {
  const SensorData({Key? key, required this.isLightTheme, required this.timer})
      : super(key: key);
  final bool isLightTheme;
  final Timer timer;

  @override
  State<SensorData> createState() => _SensorDataState();
}

class _SensorDataState extends State<SensorData> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: const [
            Text(
              "Sensor Readings",
              style: TextStyle(fontWeight: FontWeight.bold),
            )
          ],
        ),
        BlocBuilder<SensorReadingsCubit, SensorReadingsState>(
          builder: (context, state) {
            if (state is SensorReadingsInitial) {
              final forceVal = state.forceValPercent.toInt() > 100
                  ? 100
                  : state.forceValPercent.toInt();
              return SensorReading(
                isLightTheme: widget.isLightTheme,
                header: "Remaining LPG",
                sensorVal: forceVal,
              );
            } else if (state is SensorReadingsError) {
              return ErrorMessage(statusCode: state.statusCode);
            } else {
              return const SizedBox(
                height: 10,
              );
            }
          },
        ),
        BlocBuilder<SensorReadingsCubit, SensorReadingsState>(
          builder: (context, state) {
            if (state is SensorReadingsInitial) {
              final gasVal = state.gasValPercent.toInt() > 100
                  ? 100
                  : state.gasValPercent.toInt();
              return SensorReading(
                isLightTheme: widget.isLightTheme,
                header: "Lekage Health",
                sensorVal: gasVal,
              );
            } else if (state is SensorReadingsError) {
              return const Text("");
            } else {
              return const SpinKitWave(color: Colors.deepOrange);
            }
          },
        )
      ]),
    );
  }
}
