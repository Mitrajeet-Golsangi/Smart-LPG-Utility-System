import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:lpg_gas_monitoring/src/data/repositories/sensor_repository.dart';
import 'package:meta/meta.dart';

part 'sensor_readings_state.dart';

class SensorReadingsCubit extends Cubit<SensorReadingsState> {
  SensorRespository repo = SensorRespository();

  SensorReadingsCubit()
      : super(SensorReadingsInitial(
            forceValPercent: 0, gasValPercent: 0, forceVal: 0, gasVal: 0));

  Future<void> getSensorData() async {
    final data = await repo.getSensorData();
    if (data.statusCode != "200") {
      emit(SensorReadingsError(statusCode: data.statusCode));
    } else {
      emit(SensorReadingsInitial(
          forceValPercent: data.forceValPercent,
          gasValPercent: data.gasValPercent,
          forceVal: data.forceVal,
          gasVal: data.gasVal));
    }
  }

  Future<void> getSenorFormNewAddr() async {
    emit(SensorReadingsLoading());
    await getSensorData();
  }
}
