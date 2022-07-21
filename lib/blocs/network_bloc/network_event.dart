part of 'network_bloc.dart';

abstract class NetworkEvent extends Equatable {
  const NetworkEvent();

  @override
  List<Object> get props => [];
}

class GetConnection extends NetworkEvent {}

class ConnectivityChanged extends NetworkEvent {
  const ConnectivityChanged({required this.status});

  final NetworkStatus status;

  @override
  List<Object> get props => [status];
}
