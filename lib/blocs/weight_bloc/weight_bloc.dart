import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'weight_event.dart';

class WeightBloc extends HydratedBloc<WeightEvent, int> {
  WeightBloc() : super(40) {
    on<WeightValueChanged>(_mapWeightValueChangedToState);
  }

  void _mapWeightValueChangedToState(
      WeightValueChanged event, Emitter<int> emit) {
    emit(event.weightValue);
  }

  @override
  int? fromJson(Map<String, dynamic> json) {
    return json['state'];
  }

  @override
  Map<String, dynamic>? toJson(int state) {
    return {'state': state};
  }
}
