import 'package:common/infrastructure-layer/di/network_module.dart';
import 'package:common/infrastructure-layer/utils/api_base_urls.dart';
import 'package:common/infrastructure-layer/utils/network/network_info.dart';
import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:srijan_technologies_assessment/behaviour-layer/data/out/network_port.dart';
import 'package:srijan_technologies_assessment/infrastructure-layer/network_adapter.dart';
import 'package:srijan_technologies_assessment/infrastructure-layer/service/retrofit_service.dart';

part 'network_module.g.dart';

@riverpod
String getBaseUrl(GetBaseUrlRef ref) => ApiBaseUrl.getBaseUrl.apiBaseUrl;

@riverpod
BaseOptions getBaseOption(GetBaseOptionRef ref) {
  return BaseOptions(
    baseUrl: ref.read(getBaseUrlProvider),
  );
}

@riverpod
Dio getDio(GetDioRef ref) {
  Dio dio = Dio(ref.read(getBaseOptionProvider));
  dio.interceptors.addAll(
    ref.read(getInterceptorsProvider),
  );
  return dio;
}

@riverpod
RetrofitService getRetrofitService(GetRetrofitServiceRef ref) {
  return RetrofitService(
    ref.read(getDioProvider),
    baseUrl: ref.read(getBaseUrlProvider),
  );
}

@riverpod
NetworkInfo getNetworkInfo(GetNetworkInfoRef ref) =>
    NetworkInfoImpl(ref.read(getInternetConnectionProvider));

@riverpod
NetworkPort getNetworkService(GetNetworkServiceRef ref) => NetworkAdapter(
      ref.read(getRetrofitServiceProvider),
      ref.read(getNetworkInfoProvider),
    );
