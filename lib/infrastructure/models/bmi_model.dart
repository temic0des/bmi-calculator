import 'package:bmi_calculator/domain/entities/bmi.dart';
import 'package:json_annotation/json_annotation.dart';

part 'bmi_model.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class BmiModel extends Bmi {
  const BmiModel(
      {required int statusCode,
      required String requestResult,
      Map<String, dynamic>? data,
      List<String>? errors})
      : super(
          statusCode: statusCode,
          requestResult: requestResult,
          data: data,
          errors: errors,
        );

  factory BmiModel.fromJson(Map<String, dynamic> json) =>
      _$BmiModelFromJson(json);

  Map<String, dynamic> toJson() => _$BmiModelToJson(this);
}
