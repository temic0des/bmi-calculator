part of 'age_bloc.dart';

abstract class AgeEvent extends Equatable {
  const AgeEvent();

  @override
  List<Object> get props => [];
}

class AgeValueChanged extends AgeEvent {
  const AgeValueChanged({required this.ageValue});

  final int ageValue;

  @override
  List<Object> get props => [ageValue];
}
