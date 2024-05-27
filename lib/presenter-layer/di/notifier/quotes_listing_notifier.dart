import 'package:common/presenter-layer/utils/request_manager.dart';
import 'package:common/presenter-layer/utils/resource.dart';
import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:srijan_technologies_assessment/behaviour-layer/domain/di/domain_module.dart';
import 'package:srijan_technologies_assessment/behaviour-layer/domain/entity/quotes_list_entity.dart';
import 'package:srijan_technologies_assessment/behaviour-layer/domain/usecase/quote_listing/quotes_listing_usecase.dart';

part 'quotes_listing_notifier.g.dart';

@riverpod
class QuotesListingNotifier extends _$QuotesListingNotifier {
  QuotesListingNotifier();

  @override
  FutureOr<Resource<List<QuotesListingEntity>>?> build() async {
    getQuotesListingData();
    return null;
  }

  getQuotesListingData() async {
    state = const AsyncValue.loading();
    final getQuotesListingUseCase = ref.read(getQuotesListingUseCaseProvider);
    QuotesListingUseParams params = QuotesListingUseParams();
    RequestManager<List<QuotesListingEntity>>(
      params,
      createCall: () => getQuotesListingUseCase.execute(params: params),
    ).asFlow().listen(
      (result) {
        if (kDebugMode) {
          print("status: ${result.status}");
          print("response: ${result.data?.first.id}");
          result.data?.forEach((item){
            print("data: ${item.id}");
          });
        }
        state = AsyncValue.data(result);
      },
    );
  }
}
