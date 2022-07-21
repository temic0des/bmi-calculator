part of 'bmi_bloc.dart';

abstract class BmiEvent extends Equatable {
  const BmiEvent();

  @override
  List<Object> get props => [];
}

class CalculateBmiButton extends BmiEvent {
  const CalculateBmiButton(
      {required this.weight, required this.height, required this.age});

  final int weight;
  final int height;
  final int age;

  @override
  List<Object> get props => [weight, height, age];
}
