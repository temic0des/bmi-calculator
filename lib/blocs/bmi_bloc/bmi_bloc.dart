import 'dart:convert';

import 'package:bmi_calculator/infrastructure/datasources/repositories/bmi_repository.dart';
import 'package:bmi_calculator/infrastructure/models/bmi_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'bmi_event.dart';
part 'bmi_state.dart';

class BmiBloc extends Bloc<BmiEvent, BmiState> {
  BmiBloc({
    required BmiRepository bmiRepository,
  })  : _bmiRepository = bmiRepository,
        super(const BmiState()) {
    on<CalculateBmiButton>(_mapCalculateBmiToState);
  }

  final BmiRepository _bmiRepository;

  void _mapCalculateBmiToState(
      CalculateBmiButton event, Emitter<BmiState> emit) async {
    emit(state.copyWith(status: BmiStatus.inprogress));

    try {
      final data = await _bmiRepository.calculateBmi(
          height: event.height, weight: event.weight, age: event.age);

      return emit(state.copyWith(status: BmiStatus.success, data: data));
    } catch (e) {
      Map<String, dynamic> error = json.decode(e.toString());
      emit(state.copyWith(
          status: BmiStatus.failure, errors: BmiModel.fromJson(error)));
    }
  }
}
