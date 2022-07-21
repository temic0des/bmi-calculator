import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'network_event.dart';
part 'network_state.dart';

class NetworkBloc extends Bloc<NetworkEvent, NetworkState> {
  NetworkBloc() : super(const NetworkState()) {
    on<GetConnection>(_mapGetConnectionToState);
    on<ConnectivityChanged>(_mapConnectionChangedToState);
  }

  late StreamSubscription _streamSubscription;

  void _mapGetConnectionToState(
      GetConnection event, Emitter<NetworkState> emit) async {
    _streamSubscription = Connectivity().onConnectivityChanged.listen(
          (status) => add(
            ConnectivityChanged(
              status: status == ConnectivityResult.mobile ||
                      status == ConnectivityResult.wifi
                  ? NetworkStatus.success
                  : NetworkStatus.failure,
            ),
          ),
        );
  }

  void _mapConnectionChangedToState(
      ConnectivityChanged event, Emitter<NetworkState> emit) async {
    emit(state.copyWith(status: event.status));
  }

  @override
  Future<void> close() {
    _streamSubscription.cancel();
    return super.close();
  }
}
