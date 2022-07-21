import 'dart:convert';

import 'package:bloc_test/bloc_test.dart';
import 'package:bmi_calculator/blocs/bmi_bloc/bmi_bloc.dart';
import 'package:bmi_calculator/infrastructure/datasources/repositories/bmi_repository.dart';
import 'package:bmi_calculator/infrastructure/models/bmi_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'bmi_bloc_test.mocks.dart';

@GenerateMocks([BmiRepository])
void main() {
  group('Bmi Calculator', () {
    const sampleSuccessResponse = BmiModel(
        statusCode: 200,
        requestResult: 'Successful',
        data: {
          "bmi": 20.06,
          "health": "Normal",
          "healthy_bmi_range": "18.5 - 25"
        });

    const invalidWeightResponse = BmiModel(
        statusCode: 422,
        requestResult: 'Unprocessable Entity',
        errors: [
          "weight must be between 40 kg to 160 kg. ",
        ]);

    const invalidHeightResponse = BmiModel(
      statusCode: 422,
      requestResult: 'Unprocessable Entity',
      errors: ["height must be between 130 cm to 230 cm. "],
    );

    const invalidAgeResponse = BmiModel(
      statusCode: 422,
      requestResult: 'Unprocessable Entity',
      errors: ["age must be between 0 to 80 ."],
    );

    const invalidAllResponse = BmiModel(
      statusCode: 422,
      requestResult: 'requestResult',
      errors: [
        "weight must be between 40 kg to 160 kg. "
            "height must be between 130 cm to 230 cm. "
            "age must be between 0 to 80 ."
      ],
    );
    blocTest<BmiBloc, BmiState>('Emits inprogress and success when successful',
        build: () {
          final mockBmiRepository = MockBmiRepository();
          when(mockBmiRepository.calculateBmi(height: 180, weight: 65, age: 25))
              .thenAnswer((_) async => sampleSuccessResponse);
          return BmiBloc(bmiRepository: mockBmiRepository);
        },
        act: (bloc) => bloc
            .add(const CalculateBmiButton(weight: 65, height: 180, age: 25)),
        expect: () => [
              const BmiState(status: BmiStatus.inprogress),
              const BmiState(
                  status: BmiStatus.success, data: sampleSuccessResponse)
            ]);

    blocTest<BmiBloc, BmiState>(
      'Emits inprogress and failure exception when height, weight and age values are not valid',
      build: () {
        final mockBmiRepository = MockBmiRepository();
        when(mockBmiRepository.calculateBmi(height: 0, weight: 0, age: 200))
            .thenThrow(json.encode(invalidAllResponse));
        return BmiBloc(bmiRepository: mockBmiRepository);
      },
      act: (bloc) =>
          bloc.add(const CalculateBmiButton(weight: 0, height: 0, age: 200)),
      expect: () => [
        const BmiState(status: BmiStatus.inprogress),
        const BmiState(
          status: BmiStatus.failure,
          errors: invalidAllResponse,
        )
      ],
    );

    blocTest<BmiBloc, BmiState>(
      'Emits inprogress and failure exception when height is not valid',
      build: () {
        final mockBmiRepository = MockBmiRepository();
        when(mockBmiRepository.calculateBmi(height: 0, weight: 50, age: 25))
            .thenThrow(json.encode(invalidHeightResponse));
        return BmiBloc(bmiRepository: mockBmiRepository);
      },
      act: (bloc) =>
          bloc.add(const CalculateBmiButton(weight: 50, height: 0, age: 25)),
      expect: () => [
        const BmiState(status: BmiStatus.inprogress),
        const BmiState(status: BmiStatus.failure, errors: invalidHeightResponse)
      ],
    );

    blocTest<BmiBloc, BmiState>(
      'Emits inprogress and failure exception when weight is not valid',
      build: () {
        final mockBmiRepository = MockBmiRepository();
        when(mockBmiRepository.calculateBmi(height: 70, weight: 0, age: 25))
            .thenThrow(json.encode(invalidWeightResponse));
        return BmiBloc(bmiRepository: mockBmiRepository);
      },
      act: (bloc) =>
          bloc.add(const CalculateBmiButton(weight: 0, height: 70, age: 25)),
      expect: () => [
        const BmiState(status: BmiStatus.inprogress),
        const BmiState(status: BmiStatus.failure, errors: invalidWeightResponse)
      ],
    );

    blocTest<BmiBloc, BmiState>(
      'Emits inprogress and failure exception when age is not valid',
      build: () {
        final mockBmiRepository = MockBmiRepository();
        when(mockBmiRepository.calculateBmi(height: 230, weight: 41, age: 81))
            .thenThrow(json.encode(invalidAgeResponse));
        return BmiBloc(bmiRepository: mockBmiRepository);
      },
      act: (bloc) =>
          bloc.add(const CalculateBmiButton(weight: 41, height: 230, age: 81)),
      expect: () => [
        const BmiState(status: BmiStatus.inprogress),
        const BmiState(status: BmiStatus.failure, errors: invalidAgeResponse)
      ],
    );
  });
}
