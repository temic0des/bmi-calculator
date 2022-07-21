import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/weight_bloc/weight_bloc.dart';
import '../molecules/weight_section.dart';

Widget buildWeightSection() {
  return BlocBuilder<WeightBloc, int>(
    builder: (context, value) {
      return Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Weight (kg)'),
              Text(
                '${value}kg',
                style: const TextStyle(
                  fontSize: 22.0,
                ),
              ),
            ],
          ),
          const WeightSection()
        ],
      );
    },
  );
}
