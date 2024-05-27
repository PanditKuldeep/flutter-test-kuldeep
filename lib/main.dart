import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:srijan_technologies_assessment/presenter-layer/features/quote_listing/page/quote_listing_page.dart';
import 'package:srijan_technologies_assessment/presenter-layer/navigation/app_router.dart';
import 'package:srijan_technologies_assessment/presenter-layer/navigation/route_paths.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quotes Application',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: RoutePaths.quoteList,
      onGenerateRoute: AppRouter.generateRoute,
      home: const QuoteListingPage(),
    );
  }
}
