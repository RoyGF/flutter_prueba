import 'failure.dart';

class DataResponse<T> {
  Failure? failure;
  T? data;

  DataResponse({
    this.failure,
    this.data,
  });

  DataResponse<T> copyWith({
    Failure? failure,
    T? data,
  }) {
    return DataResponse<T>(
      failure: failure ?? this.failure,
      data: data ?? this.data,
    );
  }
}
