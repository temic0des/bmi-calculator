part of 'bmi_bloc.dart';

enum BmiStatus { initial, inprogress, success, failure }

class BmiState extends Equatable {
  const BmiState({
    this.status = BmiStatus.initial,
    this.data = const BmiModel(requestResult: '', statusCode: 200, data: {}),
    this.errors =
        const BmiModel(statusCode: 422, requestResult: '', errors: []),
  });

  final BmiStatus status;
  final BmiModel data;
  final BmiModel errors;

  BmiState copyWith({
    BmiStatus? status,
    BmiModel? data,
    BmiModel? errors,
  }) {
    return BmiState(
        status: status ?? this.status,
        data: data ?? this.data,
        errors: errors ?? this.errors);
  }

  @override
  List<Object?> get props => [status, data, errors];
}
