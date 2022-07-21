import 'package:bmi_calculator/blocs/age_bloc/age.dart';
import 'package:bmi_calculator/blocs/bmi_bloc/bmi_bloc.dart';
import 'package:bmi_calculator/blocs/gender_bloc/gender.dart';
import 'package:bmi_calculator/blocs/height_bloc/height_bloc.dart';
import 'package:bmi_calculator/blocs/network_bloc/network.dart';
import 'package:bmi_calculator/blocs/weight_bloc/weight_bloc.dart';
import 'package:bmi_calculator/infrastructure/datasources/repositories/bmi_repository.dart';
import 'package:bmi_calculator/presentation/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final storage = await HydratedStorage.build(
      storageDirectory: await getTemporaryDirectory());
  HydratedBlocOverrides.runZoned(
    () => runApp(const MyApp()),
    storage: storage,
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => GenderBloc()),
          BlocProvider(create: (_) => HeightBloc()),
          BlocProvider(create: (_) => WeightBloc()),
          BlocProvider(create: (_) => AgeBloc()),
          BlocProvider(
            create: (_) => BmiBloc(
              bmiRepository: BmiRepository(),
            ),
          ),
          BlocProvider(
            create: (_) => NetworkBloc()..add(GetConnection()),
          ),
        ],
        child: const HomeScreen(),
      ),
    );
  }
}
