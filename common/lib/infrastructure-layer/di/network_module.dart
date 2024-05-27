import 'package:common/infrastructure-layer/utils/api_interceptor.dart';
import 'package:common/infrastructure-layer/utils/network/network_info.dart';
import 'package:dio/dio.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'network_module.g.dart';

@riverpod
PrettyDioLogger getPrettyLogger(GetPrettyLoggerRef ref) {
  return PrettyDioLogger(
    request: true,
    requestBody: true,
    requestHeader: true,
    responseBody: true,
    responseHeader: true,
    logPrint: (log) {
      return print(log as String);
    },
  );
}

@riverpod
ApiInterceptor getApiInterceptor(GetApiInterceptorRef ref) => ApiInterceptor();

@riverpod
List<Interceptor> getInterceptors(GetInterceptorsRef ref) {
  var logger = ref.read(getPrettyLoggerProvider);
  var apiInterceptor = ref.read(getApiInterceptorProvider);
  return <Interceptor>[logger, apiInterceptor];
}

@riverpod
InternetConnection getInternetConnection(GetInternetConnectionRef ref) =>
    InternetConnection();
