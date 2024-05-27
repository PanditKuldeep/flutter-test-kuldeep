import 'package:common/presenter-layer/base/base_page.dart';
import 'package:flutter/material.dart';
import 'package:srijan_technologies_assessment/presenter-layer/di/notifier/quote_details_notifier.dart';
import 'package:srijan_technologies_assessment/presenter-layer/features/quote_details/template/quote_details_page_template.dart';
import 'package:common/presenter-layer/utils/app_constants.dart';
import 'package:srijan_technologies_assessment/presenter-layer/features/quote_listing/template/quote_listing_page_template.dart';

class QuoteDetailsPage extends BasePage {
  final QuoteDetailArgument? argumentsData;

  const QuoteDetailsPage({super.key, required this.argumentsData});

  @override
  QuoteDetailsPageState createState() =>
      QuoteDetailsPageState(arguments: argumentsData);
}

class QuoteDetailsPageState extends BaseStatefulPage {
  final QuoteDetailArgument? arguments;

  QuoteDetailsPageState({this.arguments});

  @override
  void initState() {
    ref
        .read(quoteDetailsNotifierProvider.notifier)
        .getQuoteDetailsById(selectedQuoteId: arguments?.quoteId ?? '');
    super.initState();
  }

  @override
  PreferredSizeWidget? buildAppbar() {
    return AppBar(
      title: Text('${AppConstants.detailsPage} ${arguments?.index}'),
      elevation: 5,
    );
  }

  @override
  Widget buildMobileView(BuildContext context, bool isWeb) {
    return QuoteDetailsPageView();
  }
}
