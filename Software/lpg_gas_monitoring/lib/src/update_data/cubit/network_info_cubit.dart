import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:network_info_plus/network_info_plus.dart';

part 'network_info_state.dart';

class NetworkInfoCubit extends Cubit<NetworkInfoState> {
  NetworkInfoCubit() : super(NetworkInfoComplete(networkInfo: const {}));

  Future<void> getNetworkInfo() async {
    final NetworkInfo info = NetworkInfo();
    Map<String, String?> m = {};
    emit(NetworkInfoLoading());
    m["IPv4"] = await info.getWifiIP();
    m["Brodcast"] = await info.getWifiBroadcast();
    m["Default Gateway"] = await info.getWifiGatewayIP();
    emit(NetworkInfoComplete(networkInfo: m));
  }
}
