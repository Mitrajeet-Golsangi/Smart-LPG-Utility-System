import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lpg_gas_monitoring/src/constants/sensor_constants.dart';
import 'package:lpg_gas_monitoring/src/data/dataproviders/sensor_api.dart';
import 'package:lpg_gas_monitoring/src/home/cubit/sensor_readings_cubit.dart';
import 'package:lpg_gas_monitoring/src/home/heading/heading_row.dart';
import 'package:lpg_gas_monitoring/src/home/heading/heading_symbol.dart';
import 'package:lpg_gas_monitoring/src/home/scroll_handle.dart';
import 'package:lpg_gas_monitoring/src/home/sensor_data.dart';
import 'package:lpg_gas_monitoring/src/home/sensor_graph.dart';
import 'package:lpg_gas_monitoring/src/settings/settings_controller.dart';
import 'package:network_info_plus/network_info_plus.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key, required this.controller}) : super(key: key);
  final SettingsController controller;
  static const routeName = '/home';
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Timer? timer;
  NetworkInfo info = NetworkInfo();

  Timer startTimer() {
    return Timer.periodic(
        const Duration(milliseconds: SensorConstants.timerDelay),
        (timer) async {
      BlocProvider.of<SensorReadingsCubit>(context).getSensorData();
    });
  }

  void setHost() async {
    String? host = await info.getWifiIP();
    SensorAPI.host = host!;
  }

  @override
  void initState() {
    super.initState();
    setHost();
    timer = startTimer();
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isLightTheme =
        widget.controller.themeMode == ThemeMode.light ? true : false;
    return Scaffold(
      body: Stack(
        children: [
          HeadingRow(
            controller: widget.controller,
            isLightTheme: isLightTheme,
            reloadTimer: () {
              setState(() {});
            },
          ),
          const HeadingSymbol(),
          DraggableScrollableSheet(
              initialChildSize: 0.7,
              minChildSize: 0.7,
              builder:
                  (BuildContext builder, ScrollController scrollController) {
                return ListView.builder(
                  controller: scrollController,
                  itemCount: 1,
                  itemBuilder: (context, index) {
                    return Container(
                        decoration: BoxDecoration(
                          color: isLightTheme
                              ? Colors.grey[300]
                              : Colors.grey[700],
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(25),
                            topRight: Radius.circular(25),
                          ),
                        ),
                        child: Column(
                          children: [
                            const SizedBox(height: 10),
                            const ScrollHandle(),
                            const SizedBox(height: 20),
                            SensorData(
                                isLightTheme: isLightTheme, timer: timer!),
                            const Divider(
                              color: Colors.grey,
                              thickness: 2,
                            ),
                            const SizedBox(height: 20),
                            SensorGraphs(isLightTheme: isLightTheme),
                            const SizedBox(height: 50),
                          ],
                        ));
                  },
                );
              })
        ],
      ),
    );
  }
}
