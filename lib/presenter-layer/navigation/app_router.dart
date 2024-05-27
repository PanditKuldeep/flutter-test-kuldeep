import 'package:flutter/cupertino.dart';
import 'package:srijan_technologies_assessment/presenter-layer/features/quote_details/page/quote_details_page.dart';
import 'package:srijan_technologies_assessment/presenter-layer/features/quote_listing/page/quote_listing_page.dart';
import 'package:srijan_technologies_assessment/presenter-layer/features/quote_listing/template/quote_listing_page_template.dart';
import 'route_paths.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutePaths.quoteList:
        return CupertinoPageRoute(
          builder: (context) => const QuoteListingPage(),
          settings: const RouteSettings(name: RoutePaths.quoteList),
        );
      case RoutePaths.quoteDetails:
        return CupertinoPageRoute(
          builder: (context) => QuoteDetailsPage(
              argumentsData: settings.arguments as QuoteDetailArgument),
          settings: const RouteSettings(name: RoutePaths.quoteDetails),
        );
      default:
        return CupertinoPageRoute(
          builder: (context) => Container(),
        );
    }
  }
}
