// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bmi_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BmiModel _$BmiModelFromJson(Map<String, dynamic> json) => BmiModel(
      statusCode: json['status_code'] as int,
      requestResult: json['request_result'] as String,
      data: json['data'] as Map<String, dynamic>?,
      errors:
          (json['errors'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$BmiModelToJson(BmiModel instance) => <String, dynamic>{
      'status_code': instance.statusCode,
      'request_result': instance.requestResult,
      'data': instance.data,
      'errors': instance.errors,
    };
