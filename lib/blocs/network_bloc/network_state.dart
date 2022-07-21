part of 'network_bloc.dart';

enum NetworkStatus { initial, inprogress, success, failure }

class NetworkState extends Equatable {
  const NetworkState({this.status = NetworkStatus.initial});

  final NetworkStatus status;

  NetworkState copyWith({NetworkStatus? status}) {
    return NetworkState(status: status ?? this.status);
  }

  @override
  List<Object?> get props => [status];
}
