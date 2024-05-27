import 'package:common/behaviour-layer/shared/model/app_error.dart';
import 'package:common/behaviour-layer/shared/model/error_info.dart';
import 'package:common/behaviour-layer/shared/utils/mapper/base_layer_transformer.dart';

abstract class BaseError extends BaseLayerDataTransformer<BaseError, AppError>
    implements Exception {
  final ErrorInfo error;
  final Exception cause;

  BaseError({required this.error, required this.cause});

  String getFriendlyMessage();

  logError() {}
}
