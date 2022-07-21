import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/gender_bloc/gender.dart';
import '../../infrastructure/models/gender_model.dart';
import '../atoms/gender_button.dart';

class GenderSection extends StatelessWidget {
  const GenderSection({
    Key? key,
    required this.state,
  }) : super(key: key);

  final GenderEnum state;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: GenderButton(
            genderIcon: Icons.male,
            genderText: 'Male',
            genderIconColor: Colors.brown,
            selectedColor: state == GenderEnum.male
                ? const Color(0xFF222222)
                : Colors.transparent,
            onTap: () =>
                context.read<GenderBloc>().add(MaleGenderButtonTapped()),
          ),
        ),
        const SizedBox(width: 10.0),
        Expanded(
          child: GenderButton(
            genderIcon: Icons.female,
            genderText: 'Female',
            genderIconColor: Colors.pinkAccent,
            selectedColor: state == GenderEnum.female
                ? const Color(0xFF222222)
                : Colors.transparent,
            onTap: () =>
                context.read<GenderBloc>().add(FemaleGenderButtonTapped()),
          ),
        ),
      ],
    );
  }
}
