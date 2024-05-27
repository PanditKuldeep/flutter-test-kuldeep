
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:srijan_technologies_assessment/behaviour-layer/data/repository/quotes_repository_impl.dart';
import 'package:srijan_technologies_assessment/behaviour-layer/domain/repository/quotes_repository.dart';
import 'package:srijan_technologies_assessment/infrastructure-layer/di/network_module.dart';

part 'data_module.g.dart';

@riverpod
QuotesRepository getQuotesRepository(GetQuotesRepositoryRef ref) {
  return QuotesRepositoryImpl(ref.read(getNetworkServiceProvider));
}
