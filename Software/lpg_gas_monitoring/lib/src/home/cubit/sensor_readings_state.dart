part of 'sensor_readings_cubit.dart';

@immutable
abstract class SensorReadingsState extends Equatable {
  @override
  List<Object> get props => [];
}

class SensorReadingsInitial extends SensorReadingsState {
  SensorReadingsInitial(
      {required this.forceValPercent,
      required this.gasValPercent,
      required this.forceVal,
      required this.gasVal});

  final double forceValPercent;
  final double gasValPercent;
  final double forceVal;
  final double gasVal;

  @override
  List<Object> get props => [forceValPercent, gasValPercent, forceVal, gasVal];
}

class SensorReadingsLoading extends SensorReadingsState {
  final bool isLoading = false;

  @override
  List<Object> get props => [isLoading];
}

class SensorReadingsError extends SensorReadingsState {
  SensorReadingsError({required this.statusCode});
  final String statusCode;
  // final Timer timer;

  @override
  // List<Object> get props => [statusCode, timer];
  List<Object> get props => [statusCode];
}
