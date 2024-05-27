import 'package:common/behaviour-layer/shared/const/error_type.dart';
import 'package:common/behaviour-layer/shared/model/error_info.dart';

class AppError implements Exception {
  ErrorType type;
  ErrorInfo error;
  Exception throwable;

  AppError({
    required this.throwable,
    required this.error,
    required this.type,
  });
}