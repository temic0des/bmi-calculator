import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/weight_bloc/weight_bloc.dart';
import '../atoms/weight_slider.dart';

class WeightSection extends StatelessWidget {
  const WeightSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WeightSlider(
      onChanged: (double weightValue) {
        context.read<WeightBloc>().add(
              WeightValueChanged(
                weightValue: weightValue.toInt(),
              ),
            );
      },
    );
  }
}
