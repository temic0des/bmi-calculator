import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'weight_event.dart';

class WeightBloc extends Bloc<WeightEvent, int> {
  WeightBloc() : super(40) {
    on<WeightValueChanged>(_mapWeightValueChangedToState);
  }

  void _mapWeightValueChangedToState(
      WeightValueChanged event, Emitter<int> emit) {
    emit(event.weightValue);
  }
}
