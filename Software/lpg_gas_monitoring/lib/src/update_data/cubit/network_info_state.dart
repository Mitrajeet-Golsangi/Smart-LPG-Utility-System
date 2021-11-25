part of 'network_info_cubit.dart';

@immutable
abstract class NetworkInfoState extends Equatable {
  @override
  List<Object> get props => [];
}

class NetworkInfoComplete extends NetworkInfoState {
  NetworkInfoComplete({required this.networkInfo});
  final Map<String, String?> networkInfo;
}

class NetworkInfoLoading extends NetworkInfoState {
  final bool isLoading = false;

  @override
  List<Object> get props => [isLoading];
}
