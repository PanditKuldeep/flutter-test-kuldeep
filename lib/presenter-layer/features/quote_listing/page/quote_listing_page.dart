import 'package:common/presenter-layer/base/base_page.dart';
import 'package:flutter/material.dart';
import 'package:srijan_technologies_assessment/presenter-layer/di/notifier/quotes_listing_notifier.dart';
import 'package:srijan_technologies_assessment/presenter-layer/features/quote_listing/template/quote_listing_page_template.dart';
import 'package:common/presenter-layer/utils/app_constants.dart';

class QuoteListingPage extends BasePage {

  const QuoteListingPage({super.key});

  @override
  QuoteListingPageState createState() => QuoteListingPageState();
}

class QuoteListingPageState extends BaseStatefulPage {
  @override
  void initState() {
    ref.read(quotesListingNotifierProvider.future);
    super.initState();
  }

  @override
  PreferredSizeWidget? buildAppbar() {
    return AppBar(
      title: const Text(AppConstants.homePage),
      automaticallyImplyLeading: false,
      elevation: 5,
    );
  }

  @override
  Widget buildMobileView(BuildContext context, bool isWeb) {
    return QuoteListingPageView();
  }
}
