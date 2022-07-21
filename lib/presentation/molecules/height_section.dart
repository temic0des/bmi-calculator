import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/height_bloc/height.dart';
import '../atoms/height_slider.dart';

class HeightSection extends StatelessWidget {
  const HeightSection({Key? key, required this.value}) : super(key: key);

  final double value;

  @override
  Widget build(BuildContext context) {
    return HeightSlider(
      value: value,
      label: '${value.toInt()}',
      onchanged: (double value) {
        context.read<HeightBloc>().add(HeightValueChanged(heightValue: value));
      },
    );
  }
}
