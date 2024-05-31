import 'package:common/presenter-layer/base/base_page.dart';
import 'package:common/presenter-layer/utils/resource.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:common/presenter-layer/molecules/async_builder.dart';
import 'package:srijan_technologies_assessment/behaviour-layer/domain/entity/quotes_list_entity.dart';
import 'package:srijan_technologies_assessment/presenter-layer/di/notifier/quotes_listing_notifier.dart';
import 'package:srijan_technologies_assessment/presenter-layer/features/quote_listing/organism/quote_item.dart';
import 'package:srijan_technologies_assessment/presenter-layer/navigation/route_paths.dart';

class QuoteListingPageView extends BasePageViewWidget {
  QuoteListingPageView();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final response = ref.watch(quotesListingNotifierProvider);
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
            child: ListView.builder(
                itemCount: response.value?.data?.length ?? 0,
                padding: const EdgeInsets.all(8.0),
                itemBuilder: (context, index) {
                  QuotesListingEntity entity = response.value?.data?[index] ??
                      const QuotesListingEntity();
                  return QuoteItem(
                    quoteItem: entity,
                    index: index + 1,
                    onItemClick: (quoteId) {
                      Navigator.pushNamed(
                        context,
                        RoutePaths.quoteDetails,
                        arguments: QuoteDetailArgument(
                            index: index + 1, quoteId: quoteId),
                      );
                    },
                  );
                }),
          ),
          failureWidget: Text(
            response.value?.appError?.error.message ?? "",
          ),
        ),
      ],
    );
  }
}

class QuoteDetailArgument {
  final int index;
  final String quoteId;

  QuoteDetailArgument({required this.index, required this.quoteId});
}
