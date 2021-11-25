import 'package:lpg_gas_monitoring/src/home/cubit/sensor_readings_cubit.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void main() {
  group("SensorReadingsCubit:", () {
    SensorReadingsCubit cubit = SensorReadingsCubit();

    tearDown(() {
      cubit.close();
    });

    test('Initial is SensorReadingsInitial(forceVal: 0, gasVal: 0)', () {
      expect(
          cubit.state,
          SensorReadingsInitial(
              forceValPercent: 0, forceVal: 0, gasValPercent: 0, gasVal: 0));
    });
  });
}
