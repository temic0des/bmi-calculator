part of 'height_bloc.dart';

abstract class HeightEvent extends Equatable {
  const HeightEvent();

  @override
  List<Object> get props => [];
}

class HeightValueChanged extends HeightEvent {
  const HeightValueChanged({required this.heightValue});

  final double heightValue;

  @override
  List<Object> get props => [heightValue];
}
