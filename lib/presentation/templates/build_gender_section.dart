import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/gender_bloc/gender_bloc.dart';
import '../../infrastructure/models/gender_model.dart';
import '../molecules/gender_section.dart';

Widget buildGenderSection() {
  return BlocBuilder<GenderBloc, GenderEnum>(
    builder: (context, state) {
      return GenderSection(state: state);
    },
  );
}
