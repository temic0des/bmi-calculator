import 'package:bmi_calculator/domain/logic/get_gender.dart';
import 'package:bmi_calculator/infrastructure/models/gender_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../../blocs/bmi_bloc/bmi_bloc.dart';
import '../../infrastructure/datasources/repositories/bmi_repository.dart';

class BmiCalculator extends StatelessWidget {
  const BmiCalculator({
    Key? key,
    required this.selectedWeight,
    required this.selectedHeight,
    required this.selectedAge,
    required this.selectedGender,
  }) : super(key: key);

  final int selectedWeight;
  final double selectedHeight;
  final int selectedAge;
  final GenderEnum selectedGender;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        showMaterialModalBottomSheet(
          context: context,
          builder: (context) {
            return BlocProvider(
              create: (context) => BmiBloc(bmiRepository: BmiRepository())
                ..add(
                  CalculateBmiButton(
                    weight: selectedWeight,
                    height: selectedHeight.toInt(),
                    age: selectedAge,
                  ),
                ),
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0),
                  ),
                ),
                height: MediaQuery.of(context).size.height / 2,
                child: Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: BlocConsumer<BmiBloc, BmiState>(
                    listener: (context, state) {
                      switch (state.status) {
                        case BmiStatus.failure:
                          ScaffoldMessenger.of(context)
                            ..hideCurrentSnackBar()
                            ..showSnackBar(
                              SnackBar(
                                content: ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: state.errors.errors!.length,
                                  itemBuilder: (context, index) {
                                    return Text(state.errors.errors![index]);
                                  },
                                ),
                              ),
                            );
                          break;
                        default:
                      }
                    },
                    builder: (context, state) {
                      switch (state.status) {
                        case BmiStatus.initial:
                          return const Center(
                            child: Text('Calculating BMI...'),
                          );
                        case BmiStatus.inprogress:
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        case BmiStatus.success:
                          final result = state.data;
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                'Your BMI is',
                                style: TextStyle(fontSize: 18.0),
                              ),
                              const SizedBox(height: 20.0),
                              Text(
                                '${result.data!['bmi']}',
                                style: const TextStyle(
                                  fontSize: 48.0,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                              const SizedBox(height: 20.0),
                              Text(
                                'This shows that you are ${result.data!['health']} ${getGender(selectedGender)}. The healthy bmi range is between ${result.data!['healthy_bmi_range']}',
                                textAlign: TextAlign.center,
                                style:
                                    const TextStyle(color: Color(0xFFCCCCCC)),
                              ),
                            ],
                          );
                        default:
                          return Container();
                      }
                    },
                  ),
                ),
              ),
            );
          },
        );
      },
      icon: const Icon(
        Icons.woman,
        size: 40.0,
      ),
    );
  }
}
