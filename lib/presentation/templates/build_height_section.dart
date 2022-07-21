import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/height_bloc/height_bloc.dart';
import '../molecules/height_section.dart';

Widget buildHeightSection() {
  return BlocBuilder<HeightBloc, double>(
    builder: (context, value) {
      return HeightSection(value: value);
    },
  );
}
