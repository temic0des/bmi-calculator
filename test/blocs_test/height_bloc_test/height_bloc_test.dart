import 'package:bloc_test/bloc_test.dart';
import 'package:bmi_calculator/blocs/height_bloc/height_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('HeightBloc', () {
    blocTest<HeightBloc, double>(
      'Emits nothing by default ',
      build: () => HeightBloc(),
      expect: () => [],
    );

    blocTest<HeightBloc, double>(
      'Emits [20.0] when value is changed',
      build: () => HeightBloc(),
      act: (bloc) => bloc.add(const HeightValueChanged(heightValue: 20.0)),
      expect: () => [20.0],
    );

    blocTest<HeightBloc, double>(
      'Emits [100.0] when value is changed',
      build: () => HeightBloc(),
      act: (bloc) => bloc.add(const HeightValueChanged(heightValue: 100.0)),
      expect: () => [100.0],
    );
  });
}
