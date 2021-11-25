import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:lpg_gas_monitoring/src/update_data/cubit/network_info_cubit.dart';

class AvailableNetworks extends StatelessWidget {
  const AvailableNetworks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          "Available Networks",
          style: TextStyle(
            fontSize: 20,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: BlocBuilder<NetworkInfoCubit, NetworkInfoState>(
            builder: (context, state) {
              if (state is NetworkInfoComplete) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: state.networkInfo.entries
                      .map<Widget>(
                        (e) => Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                e.key,
                                style: const TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                e.value!,
                                style: const TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                      )
                      .toList(),
                );
              } else {
                return const SpinKitWave(color: Colors.deepOrange);
              }
            },
          ),
        )
      ],
    );
  }
}
