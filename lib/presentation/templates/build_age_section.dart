import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/age_bloc/age_bloc.dart';
import '../molecules/age_section.dart';

BlocBuilder<AgeBloc, int> buildAgeSection() {
  return BlocBuilder<AgeBloc, int>(
    builder: (context, value) {
      return Row(
        children: [
          const Text(
            'Age',
            style: TextStyle(fontSize: 20.0),
          ),
          Expanded(
            child: AgeSection(value: value),
          ),
        ],
      );
    },
  );
}
