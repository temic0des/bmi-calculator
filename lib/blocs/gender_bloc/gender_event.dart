part of 'gender_bloc.dart';

abstract class GenderEvent extends Equatable {
  const GenderEvent();

  @override
  List<Object> get props => [];
}

class MaleGenderButtonTapped extends GenderEvent {}

class FemaleGenderButtonTapped extends GenderEvent {}
