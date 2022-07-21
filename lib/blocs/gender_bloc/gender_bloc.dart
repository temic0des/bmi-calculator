import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../infrastructure/models/gender_model.dart';

part 'gender_event.dart';

class GenderBloc extends Bloc<GenderEvent, GenderEnum> {
  GenderBloc() : super(GenderEnum.none) {
    on<MaleGenderButtonTapped>(_mapGenderButtonTappedToState);
    on<FemaleGenderButtonTapped>(_mapFemaleGenderButtonTappedToState);
  }

  void _mapGenderButtonTappedToState(
      MaleGenderButtonTapped event, Emitter<GenderEnum> emit) {
    emit(GenderEnum.male);
  }

  void _mapFemaleGenderButtonTappedToState(
      FemaleGenderButtonTapped event, Emitter<GenderEnum> emit) {
    emit(GenderEnum.female);
  }
}
