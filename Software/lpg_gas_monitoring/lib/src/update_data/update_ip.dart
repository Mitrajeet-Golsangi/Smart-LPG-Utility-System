import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lpg_gas_monitoring/src/data/dataproviders/sensor_api.dart';
import 'package:lpg_gas_monitoring/src/home/cubit/sensor_readings_cubit.dart';
import 'package:lpg_gas_monitoring/src/update_data/available_networks.dart';
import 'package:lpg_gas_monitoring/src/update_data/cubit/network_info_cubit.dart';

class UpdateIP extends StatefulWidget {
  const UpdateIP({Key? key}) : super(key: key);
  static const routeName = '/updateIp';

  @override
  State<UpdateIP> createState() => _UpdateIPState();
}

class _UpdateIPState extends State<UpdateIP> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<NetworkInfoCubit>(context).getNetworkInfo();
  }

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    TextEditingController _ipController =
        TextEditingController(text: SensorAPI.host.toString());
    TextEditingController _portController =
        TextEditingController(text: SensorAPI.port.toString());
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 80),
            const Center(
              child: Text(
                "Change the value of Network IP",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 60),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: _ipController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "IP cannot be empty";
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        labelText: "Network IP",
                      ),
                      keyboardType: TextInputType.number,
                      maxLength: 14,
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: _portController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Port cannot be empty";
                        }
                        return null;
                      },
                      maxLength: 4,
                      decoration: const InputDecoration(
                        labelText: "Port",
                      ),
                      keyboardType: TextInputType.number,
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          SensorAPI.host = _ipController.text.toString();
                          SensorAPI.port = _portController.text.toString();
                          BlocProvider.of<SensorReadingsCubit>(context)
                              .getSenorFormNewAddr();
                          Navigator.pop(context);
                        }
                      },
                      child: const Text("Change"),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            const AvailableNetworks()
          ],
        ),
      ),
    );
  }
}
