import 'package:common/presenter-layer/utils/request_manager.dart';
import 'package:common/presenter-layer/utils/resource.dart';
import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:srijan_technologies_assessment/behaviour-layer/domain/di/domain_module.dart';
import 'package:srijan_technologies_assessment/behaviour-layer/domain/entity/quote_details_entity.dart';
import 'package:srijan_technologies_assessment/behaviour-layer/domain/entity/quotes_list_entity.dart';
import 'package:srijan_technologies_assessment/behaviour-layer/domain/usecase/quote_details/quote_detail_usecase.dart';
import 'package:srijan_technologies_assessment/behaviour-layer/domain/usecase/quote_listing/quotes_listing_usecase.dart';

part 'quote_details_notifier.g.dart';

@riverpod
class QuoteDetailsNotifier extends _$QuoteDetailsNotifier {
  QuoteDetailsNotifier();

  @override
  FutureOr<Resource<QuoteDetailsEntity>?> build() async {
    return null;
  }

  getQuoteDetailsById({required String selectedQuoteId}) async {
    final getQuoteDetailsUseCase = ref.read(getQuoteDetailsUseCaseProvider);
    QuoteDetailsUseParams params =
        QuoteDetailsUseParams(selectedQuoteId: selectedQuoteId);
    RequestManager<QuoteDetailsEntity>(
      params,
      createCall: () => getQuoteDetailsUseCase.execute(params: params),
    ).asFlow().listen(
      (result) {
        state = AsyncValue.data(result);
      },
    );
  }
}
