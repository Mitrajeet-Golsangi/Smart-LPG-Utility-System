import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lpg_gas_monitoring/src/components/error_message.dart';
import 'package:lpg_gas_monitoring/src/components/sensor_graphs.dart';
import 'package:lpg_gas_monitoring/src/home/cubit/sensor_readings_cubit.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SensorGraphs extends StatelessWidget {
  const SensorGraphs({Key? key, required this.isLightTheme}) : super(key: key);
  final bool isLightTheme;

  @override
  Widget build(BuildContext context) {
    double forceVal = 0;
    double gasVal = 0;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                "Real Time Outputs",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(height: 10),
          BlocBuilder<SensorReadingsCubit, SensorReadingsState>(
              builder: (context, state) {
            if (state is SensorReadingsInitial) {
              forceVal = state.forceVal;
              return SensorGraph(
                isLightTheme: isLightTheme,
                graphColor: Colors.green,
                sensorName: "Force",
                sensorVal: forceVal,
              );
            } else if (state is SensorReadingsError) {
              return ErrorMessage(statusCode: state.statusCode);
            } else {
              return const SpinKitWave(
                color: Colors.deepOrange,
              );
            }
          }),
          BlocBuilder<SensorReadingsCubit, SensorReadingsState>(
            builder: (context, state) {
              if (state is SensorReadingsInitial) {
                gasVal = state.gasVal;
                return SensorGraph(
                  isLightTheme: isLightTheme,
                  graphColor: Colors.red,
                  sensorName: "Gas",
                  sensorVal: gasVal,
                );
              } else if (state is SensorReadingsError) {
                return const Center(child: Text(""));
              } else {
                return const SizedBox(
                  height: 410,
                );
              }
            },
          )
        ],
      ),
    );
  }
}
