import 'package:flutter/material.dart';
import 'package:lpg_gas_monitoring/src/settings/settings_controller.dart';
import 'package:lpg_gas_monitoring/src/update_data/update_ip.dart';

class HeadingRow extends StatelessWidget {
  const HeadingRow(
      {Key? key,
      required this.controller,
      required this.isLightTheme,
      required this.reloadTimer})
      : super(key: key);
  final SettingsController controller;
  final bool isLightTheme;
  final Function reloadTimer;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 50),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: [
          const Text("LPG Gas Utility System",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () async {
                  Navigator.pushNamed(context, UpdateIP.routeName)
                      .then((_) => reloadTimer);
                },
                icon: const Icon(Icons.info_outline),
              ),
              IconButton(
                onPressed: () => controller.updateThemeMode(
                    isLightTheme ? ThemeMode.dark : ThemeMode.light),
                icon: Icon(isLightTheme
                    ? Icons.brightness_3
                    : Icons.wb_sunny_outlined),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
