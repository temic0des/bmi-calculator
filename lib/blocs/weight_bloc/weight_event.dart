part of 'weight_bloc.dart';

abstract class WeightEvent extends Equatable {
  const WeightEvent();

  @override
  List<Object> get props => [];
}

class WeightValueChanged extends WeightEvent {
  const WeightValueChanged({required this.weightValue});

  final int weightValue;

  @override
  List<Object> get props => [weightValue];
}
