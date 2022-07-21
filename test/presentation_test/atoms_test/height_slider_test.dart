import 'package:bmi_calculator/presentation/atoms/height_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Height Slider with slider and text', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: HeightSlider(value: 140.0),
        ),
      ),
    );

    final textFinder = find.text('Height (in cm)');
    final sliderFinder = find.byType(Slider);

    expect(textFinder, findsOneWidget);
    expect(sliderFinder, findsOneWidget);
  });
}
