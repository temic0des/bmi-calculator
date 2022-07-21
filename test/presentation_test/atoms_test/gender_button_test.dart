import 'package:bmi_calculator/presentation/atoms/gender_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Gender Button', () {
    testWidgets('Button has an icon and a text', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: GenderButton(genderIcon: Icons.male, genderText: 'male'),
          ),
        ),
      );

      final genderIconFinder = find.byIcon(Icons.male);
      final genderTextFinder = find.text('male');

      expect(genderIconFinder, findsOneWidget);
      expect(genderTextFinder, findsOneWidget);
    });
  });
}
