import 'package:bmi_calculator/domain/logic/debounce_event.dart';
import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'age_event.dart';

class AgeBloc extends HydratedBloc<AgeEvent, int> {
  AgeBloc() : super(0) {
    on<AgeValueChanged>(_mapAgeValueChangedToState,
        transformer: debounceEvent(debounceDuration));
  }

  void _mapAgeValueChangedToState(AgeValueChanged event, Emitter<int> emit) {
    emit(event.ageValue);
  }

  @override
  int? fromJson(Map<String, dynamic> json) {
    return json['state'] as int;
  }

  @override
  Map<String, dynamic>? toJson(int state) {
    return {'state': state};
  }
}
