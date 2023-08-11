import 'data_response.dart';

abstract class BaseUseCase<T> {
  Future<DataResponse<T>> call();
}
