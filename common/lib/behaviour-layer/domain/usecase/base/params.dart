import 'package:common/behaviour-layer/shared/model/app_error.dart';
import 'package:dartz/dartz.dart';

abstract class Params {
  final bool reloading;

  Params({this.reloading = false});

  Either<AppError, bool> verify();
}
