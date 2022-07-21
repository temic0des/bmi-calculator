import 'package:bloc_test/bloc_test.dart';
import 'package:bmi_calculator/blocs/gender_bloc/gender_bloc.dart';
import 'package:bmi_calculator/infrastructure/models/gender_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('GenderBloc', () {
    blocTest<GenderBloc, GenderEnum>(
      'Emits [] nothing by default',
      build: () => GenderBloc(),
      expect: () => [],
    );

    blocTest<GenderBloc, GenderEnum>(
      'Emits GenderEnum.male when GenderButtonTapped Event is Pressed',
      build: () => GenderBloc(),
      act: (bloc) => bloc.add(MaleGenderButtonTapped()),
      expect: () => [GenderEnum.male],
    );

    blocTest<GenderBloc, GenderEnum>(
      'Emits GenderEnum.female when GenderButtonTapped Event is Pressed',
      build: () => GenderBloc(),
      act: (bloc) => bloc.add(FemaleGenderButtonTapped()),
      expect: () => [GenderEnum.female],
    );
  });
}
