import 'package:equatable/equatable.dart';

class Bmi extends Equatable {
  const Bmi({
    required this.statusCode,
    required this.requestResult,
    this.data,
    this.errors,
  });

  final int statusCode;
  final String requestResult;
  final Map<String, dynamic>? data;
  final List<String>? errors;

  @override
  List<Object?> get props => [statusCode, requestResult, data, errors];
}
