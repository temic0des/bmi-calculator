import 'package:flutter/material.dart';
import 'package:vertical_weight_slider/vertical_weight_slider.dart';

class WeightSlider extends StatelessWidget {
  const WeightSlider({Key? key, required this.onChanged}) : super(key: key);

  final Function(double) onChanged;

  @override
  Widget build(BuildContext context) {
    return VerticalWeightSlider(
      isVertical: false,
      maxWeight: 160,
      controller: WeightSliderController(
        minWeight: 40,
        initialWeight: 40,
      ),
      onChanged: onChanged,
    );
  }
}
