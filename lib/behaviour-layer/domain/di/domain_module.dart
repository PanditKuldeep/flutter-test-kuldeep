import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:srijan_technologies_assessment/behaviour-layer/data/di/data_module.dart';
import 'package:srijan_technologies_assessment/behaviour-layer/domain/usecase/quote_details/quote_detail_usecase.dart';
import 'package:srijan_technologies_assessment/behaviour-layer/domain/usecase/quote_listing/quotes_listing_usecase.dart';

part 'domain_module.g.dart';

@riverpod
QuotesListingUseCase getQuotesListingUseCase(GetQuotesListingUseCaseRef ref) =>
    QuotesListingUseCase(
        quotesRepository: ref.read(getQuotesRepositoryProvider));

@riverpod
QuoteDetailsUseCase getQuoteDetailsUseCase(GetQuoteDetailsUseCaseRef ref) =>
    QuoteDetailsUseCase(
        quotesRepository: ref.read(getQuotesRepositoryProvider));
