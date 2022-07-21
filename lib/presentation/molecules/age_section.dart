import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:numberpicker/numberpicker.dart';

import '../../blocs/age_bloc/age.dart';

class AgeSection extends StatelessWidget {
  const AgeSection({Key? key, required this.value}) : super(key: key);

  final int value;

  @override
  Widget build(BuildContext context) {
    return NumberPicker(
      axis: Axis.horizontal,
      minValue: 0,
      maxValue: 80,
      value: value,
      onChanged: (int value) {
        context.read<AgeBloc>().add(AgeValueChanged(ageValue: value));
      },
    );
  }
}
