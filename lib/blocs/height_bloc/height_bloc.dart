import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/logic/debounce_event.dart';

part 'height_event.dart';

class HeightBloc extends Bloc<HeightEvent, double> {
  HeightBloc() : super(130.0) {
    on<HeightValueChanged>(_mapHeightValueChangedToState,
        transformer: debounceEvent(debounceDuration));
  }

  void _mapHeightValueChangedToState(
      HeightValueChanged event, Emitter<double> emit) {
    emit(event.heightValue);
  }
}
