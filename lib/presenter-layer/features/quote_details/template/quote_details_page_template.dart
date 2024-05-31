import 'package:common/presenter-layer/base/base_page.dart';
import 'package:common/presenter-layer/utils/resource.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:common/presenter-layer/molecules/async_builder.dart';
import 'package:srijan_technologies_assessment/behaviour-layer/domain/entity/quote_details_entity.dart';
import 'package:srijan_technologies_assessment/presenter-layer/di/notifier/quote_details_notifier.dart';
import 'package:srijan_technologies_assessment/presenter-layer/features/quote_details/organism/quotes_details.dart';

class QuoteDetailsPageView extends BasePageViewWidget {
  QuoteDetailsPageView();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final response = ref.watch(quoteDetailsNotifierProvider);
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        AsyncBuilder(
          unableLoader: response.value?.status == null ||
              response.value?.status == Status.loading,
          isSuccess: response.value?.status == Status.success,
          successWidget: Expanded(
            child: QuotesDetails(
                entity: response.value?.data ?? QuoteDetailsEntity()),
          ),
          failureWidget: Text(
            response.value?.appError?.error.message ?? "",
          ),
        ),
      ],
    );
  }
}
