import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'age_event.dart';

class AgeBloc extends Bloc<AgeEvent, int> {
  AgeBloc() : super(0) {
    on<AgeValueChanged>(_mapAgeValueChangedToState);
  }

  void _mapAgeValueChangedToState(AgeValueChanged event, Emitter<int> emit) {
    emit(event.ageValue);
  }
}
