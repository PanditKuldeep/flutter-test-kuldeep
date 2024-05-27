import 'dart:io';
import 'package:common/behaviour-layer/shared/model/network_error.dart';
import 'package:common/infrastructure-layer/utils/get_error.dart';
import 'package:common/infrastructure-layer/utils/network_code_and_message.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

Future<Either<NetworkError, T>> safeApiCall<T>(Future<T> apiCall) async {
  try {
    final originalResponse = await apiCall;
    final eitherResponse = originalResponse as HttpResponse<dynamic>;
    if (!eitherResponse.isSuccessful()) {
      return Left(getError(apiResponse: eitherResponse.response));
    } else {
      return Right(originalResponse);
    }
  } on Exception catch (throwable) {
    switch (throwable.runtimeType) {
      case const (DioException):
        switch ((throwable as DioException).type) {
          case DioExceptionType.connectionTimeout:
            if (throwable.response != null) {
              return Left(
                NetworkError(
                    cause: Exception(
                        NetworkCodeAndMessage.serverConnectionTimeOutError),
                    httpError: throwable.response!.statusCode!,
                    message: throwable.response!.statusMessage!),
              );
            }
            break;
          case DioExceptionType.sendTimeout:
            if (throwable.response != null) {
              return Left(
                NetworkError(
                    cause:
                        Exception(NetworkCodeAndMessage.serverSendTimeOutError),
                    httpError: throwable.response!.statusCode!,
                    message: throwable.response!.statusMessage!),
              );
            }
            break;
          case DioExceptionType.receiveTimeout:
            if (throwable.response != null) {
              return Left(
                NetworkError(
                    cause: Exception(
                        NetworkCodeAndMessage.serverReceiveTimeOutError),
                    httpError: throwable.response!.statusCode!,
                    message: throwable.response!.statusMessage!),
              );
            }
            break;
          case DioExceptionType.badCertificate:
            if (throwable.response != null) {
              return Left(
                NetworkError(
                    cause: Exception(NetworkCodeAndMessage.badCertificateError),
                    httpError: throwable.response!.statusCode!,
                    message: throwable.response!.statusMessage!),
              );
            }
            break;
          case DioExceptionType.badResponse:
            if (throwable.response != null) {
              return Left(
                getError(apiResponse: throwable.response!),
              );
            }
            return Left(
              NetworkError(
                  cause: Exception(NetworkCodeAndMessage.serverResponseError),
                  httpError: NetworkCodeAndMessage.internalServerCode,
                  message: NetworkCodeAndMessage.serverResponseError),
            );
          case DioExceptionType.cancel:
            break;
          case DioExceptionType.connectionError:
            break;
          case DioExceptionType.unknown:
            return Left(
              NetworkError(
                  message: NetworkCodeAndMessage.unknownError,
                  httpError: NetworkCodeAndMessage.unknownErrorCode,
                  cause: throwable),
            );
        }

        break;

      case const (IOException):
        return Left(NetworkError(
            message: throwable.toString(), httpError: 502, cause: throwable));

      case const (HttpException):
        return Left(NetworkError(
            message: (throwable as HttpException).message,
            httpError: 502,
            cause: throwable));

      default:
        return Left(NetworkError(
            message: throwable.toString(), httpError: 502, cause: throwable));
    }
    return Left(NetworkError(
        message: throwable.toString(), httpError: 502, cause: throwable));
  }
}

extension RetrofitResponse on HttpResponse {
  /// Returns true if the code is in [200..300), which means the request was successfully received,
  /// understood, and accepted.
  bool isSuccessful() {
    return response.statusCode! >= 200 && response.statusCode! < 300;
  }
}
