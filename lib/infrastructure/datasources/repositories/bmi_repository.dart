import 'dart:convert';
import 'dart:io';

import 'package:bmi_calculator/domain/settings.dart';
import 'package:bmi_calculator/infrastructure/models/bmi_model.dart';
import 'package:dio/dio.dart';

class BmiRepository {
  final dio = Dio();
  Future<BmiModel> calculateBmi(
      {required int height, required int weight, required int age}) async {
    try {
      final response = await dio.get(
        bmiUrl,
        queryParameters: {'height': height, 'weight': weight, 'age': age},
        options: Options(
          headers: {
            "X-RapidAPI-Key": apiKey,
            "X-RapidAPI-Host": apiHost,
          },
        ),
      );
      if (response.statusCode != HttpStatus.ok) {
        throw response.data;
      }
      return BmiModel.fromJson(response.data);
    } on DioError catch (e) {
      throw json.encode(e.response!.data);
    }
  }
}
