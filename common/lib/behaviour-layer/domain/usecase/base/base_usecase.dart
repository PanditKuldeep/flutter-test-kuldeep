import 'package:common/behaviour-layer/shared/model/base_error.dart';
import 'package:dartz/dartz.dart';
import 'params.dart';

abstract class BaseUseCase<E extends BaseError, P extends Params, T> {
  Future<Either<E, T>> execute({required P params});
}
