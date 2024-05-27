import 'package:common/behaviour-layer/shared/const/error_type.dart';
import 'package:common/behaviour-layer/shared/model/app_error.dart';
import 'package:common/behaviour-layer/shared/model/base_error.dart';
import 'package:common/behaviour-layer/shared/model/error_info.dart';

class NetworkError extends BaseError {
  NetworkError({
    required int httpError,
    String message = "",
    String errorMessage = "",
    required super.cause,
  }) : super(
            error: ErrorInfo(
                code: httpError, message: message, errorMessage: errorMessage));

  @override
  String getFriendlyMessage() {
    return error.message;
  }

  @override
  AppError transform() {
    switch (error.code) {
      case 400:
        return AppError(
            throwable: cause, error: error, type: ErrorType.badRequest);

      case 401:
        return AppError(
            throwable: cause, error: error, type: ErrorType.unauthorized);

      case 403:
        return AppError(
            throwable: cause, error: error, type: ErrorType.unauthorized);

      case 404:
        return AppError(
            throwable: cause, error: error, type: ErrorType.netServerMessage);

      case 500:
        return AppError(
            throwable: cause, error: error, type: ErrorType.internalServer);

      case 503:
        return AppError(
            error: error, throwable: cause, type: ErrorType.netDefaultError);

      case 504:
        return AppError(
            throwable: cause, error: error, type: ErrorType.netServerMessage);

      case 502:
        return AppError(
            throwable: cause, error: error, type: ErrorType.netServerMessage);

      default:
        return AppError(
            throwable: cause, error: error, type: ErrorType.unknown);
    }
  }
}
