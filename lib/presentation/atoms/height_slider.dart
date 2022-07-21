import 'package:flutter/material.dart';

class HeightSlider extends StatelessWidget {
  const HeightSlider(
      {Key? key, required this.value, this.onchanged, this.label})
      : super(key: key);

  final Function(double)? onchanged;
  final double value;
  final String? label;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150.0,
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFF444444)),
        borderRadius: const BorderRadius.all(
          Radius.elliptical(20, 10),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Height (in cm)'),
          Slider.adaptive(
            onChanged: onchanged,
            value: value,
            min: 130.0,
            max: 230.0,
            divisions: 230,
            label: label,
          ),
        ],
      ),
    );
  }
}
