import 'package:common/behaviour-layer/shared/model/network_error.dart';
import 'package:common/infrastructure-layer/model/error/error_info_entity.dart';
import 'package:common/infrastructure-layer/utils/network_code_and_message.dart';
import 'package:dio/dio.dart';

NetworkError getError({required Response apiResponse}) {
  if (apiResponse.data != null) {
    try {
      final ErrorInfoEntity errorResponseEntity =
          ErrorInfoEntity.fromJson(apiResponse.data);
      return NetworkError(
        httpError: errorResponseEntity.status ?? 1000,
        message: errorResponseEntity.message ?? "",
        errorMessage: errorResponseEntity.message ?? "",
        cause: Exception(NetworkCodeAndMessage.serverResponseError),
      );
    } catch (exception) {
      return NetworkError(
          cause: Exception(NetworkCodeAndMessage.serverResponseError),
          httpError: apiResponse.statusCode!,
          message: apiResponse.statusMessage!);
    }
  } else {
    return NetworkError(
        cause: Exception(NetworkCodeAndMessage.serverResponseError),
        httpError: apiResponse.statusCode!,
        message: apiResponse.statusMessage!);
  }
}
