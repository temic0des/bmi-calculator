import 'package:bmi_calculator/blocs/height_bloc/height_bloc.dart';
import 'package:bmi_calculator/blocs/weight_bloc/weight_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../blocs/age_bloc/age_bloc.dart';
import '../../blocs/gender_bloc/gender_bloc.dart';
import '../../blocs/network_bloc/network.dart';
import '../organisms/bmi_calculator.dart';
import '../templates/build_age_section.dart';
import '../templates/build_gender_section.dart';
import '../templates/build_height_section.dart';
import '../templates/build_weight_section.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final selectedHeight = context.select((HeightBloc bloc) => bloc.state);
    final selectedWeight = context.select((WeightBloc bloc) => bloc.state);
    final selectedAge = context.select((AgeBloc bloc) => bloc.state);
    final selectedGender = context.select((GenderBloc bloc) => bloc.state);

    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        shadowColor: Colors.transparent,
        title: const Text(
          'BMI Calculator',
          style: TextStyle(color: Color(0xFFCCCCCC)),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          children: [
            buildGenderSection(),
            const SizedBox(height: 20.0),
            Expanded(child: buildHeightSection()),
            const SizedBox(height: 20.0),
            buildWeightSection(),
            const SizedBox(height: 20.0),
            Expanded(child: buildAgeSection())
          ],
        ),
      ),
      bottomNavigationBar: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            height: 30.0,
            decoration: BoxDecoration(
              color: Colors.blueAccent,
              borderRadius: BorderRadius.circular(20.0),
            ),
          ),
          Container(
            width: 80.0,
            height: 80.0,
            decoration: BoxDecoration(
              color: Colors.blueAccent,
              borderRadius: BorderRadius.circular(40.0),
            ),
            child: BlocConsumer<NetworkBloc, NetworkState>(
              listener: (context, state) {
                switch (state.status) {
                  case NetworkStatus.failure:
                    ScaffoldMessenger.of(context)
                      ..hideCurrentMaterialBanner()
                      ..showSnackBar(
                        const SnackBar(
                          content: Text('No Internet Connection'),
                        ),
                      );
                    break;
                  default:
                    ScaffoldMessenger.of(context)
                      ..hideCurrentMaterialBanner()
                      ..showSnackBar(
                        const SnackBar(
                          content: Text('Internet Connection Available'),
                        ),
                      );
                }
              },
              builder: (context, state) {
                switch (state.status) {
                  case NetworkStatus.initial:
                    return const Text('Checking Network...');
                  case NetworkStatus.failure:
                    return const Center(
                      child: Text(''),
                    );
                  default:
                }
                return BmiCalculator(
                  selectedWeight: selectedWeight,
                  selectedHeight: selectedHeight,
                  selectedAge: selectedAge,
                  selectedGender: selectedGender,
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
