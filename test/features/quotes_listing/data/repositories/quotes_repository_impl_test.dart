import 'package:common/infrastructure-layer/utils/network/network_info.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:srijan_technologies_assessment/behaviour-layer/data/out/network_port.dart';
import 'package:srijan_technologies_assessment/behaviour-layer/data/repository/quotes_repository_impl.dart';
import 'package:srijan_technologies_assessment/behaviour-layer/domain/entity/quote_details_entity.dart';
import 'package:srijan_technologies_assessment/behaviour-layer/domain/entity/quotes_list_entity.dart';
import 'package:srijan_technologies_assessment/behaviour-layer/domain/repository/quotes_repository.dart';

import 'quotes_repository_impl_test.mocks.dart';

@GenerateNiceMocks([MockSpec<NetworkPort>(), MockSpec<NetworkInfo>()])
void main() {
  late QuotesRepository repository;
  late MockNetworkPort remoteDataSource;
  late MockNetworkInfo networkInfo;

  setUp(() {
    remoteDataSource = MockNetworkPort();
    networkInfo = MockNetworkInfo();
    repository = QuotesRepositoryImpl(
        networkPort: remoteDataSource, networkInfo: networkInfo);
  });

  void runTestsOnline(Function body) {
    group('device is online', () {
      setUp(() => when(networkInfo.isConnected).thenAnswer((_) async => true));
      body();
    });
  }

  group('getQuotesList and getQuotesDetails', () {
    const tLimit = 5;
    List<QuotesListingEntity> tQuotesResponse = [
      const QuotesListingEntity(
          id: 'kFTTIYLRDSTd',
          content:
              "Aerodynamically the bumblebee shouldn't be able to fly, but the bumblebee doesn't know that, so it goes on flying anyway.",
          author: 'Mary Kay Ash'),
      const QuotesListingEntity(
          id: 'r9VIoOzFdUGU',
          content:
              "The conditions of conquest are always easy. We have but to toil awhile, endure awhile, believe always, and never turn back.",
          author: 'Seneca the Younger'),
      const QuotesListingEntity(
          id: '9Jj5KgNEYVcK',
          content: "Smile, breathe and go slowly.",
          author: 'Thích Nhất Hạnh'),
      const QuotesListingEntity(
          id: 'gP3atICYApeI',
          content:
              "No pessimist ever discovered the secrets of the stars, or sailed to an uncharted land, or opened a new heaven to the human spirit.",
          author: 'Helen Keller'),
      const QuotesListingEntity(
          id: 't7L2YkK_2QWr',
          content: "As you think, so shall you become.",
          author: 'Bruce Lee'),
    ];

    List<QuotesListingEntity> tQuotesListingEntity = tQuotesResponse;

    String tSelectedId = 'An5NAXPrbN';
    QuoteDetailsEntity tQuoteDetailsResponse = QuoteDetailsEntity(
        id: '',
        content: 'Thomas Edison',
        author:
            "Hell, there are no rules here-- we're trying to accomplish something.",
        tags: [],
        authorSlug: 'thomas-edison',
        dateAdded: '2023-04-14',
        dateModified: '2023-04-14');

    QuoteDetailsEntity tQuotesDetailsEntity = tQuoteDetailsResponse;

    runTestsOnline(() {
      test(
          'should return remote listing data when the call to remote data source is success',
          () async {
        /// arrange
        when(remoteDataSource.getQuotesResponse(any))
            .thenAnswer((_) async => Right(tQuotesResponse));

        /// act
        final result = await repository.getQuotesListing(tLimit);

        /// assert
        verify(remoteDataSource.getQuotesResponse(tLimit));
        expect(result, equals(Right(tQuotesListingEntity)));
      });

      test(
          'should return remote individual details data when the call to remote data source is success',
          () async {
        /// arrange
        when(remoteDataSource.getQuoteDetailsResponseById(
                selectedQuoteId: tSelectedId))
            .thenAnswer((_) async => Right(tQuoteDetailsResponse));

        /// act
        final result =
            await repository.getQuoteDetailsById(selectedQuoteId: tSelectedId);

        /// assert
        verify(remoteDataSource.getQuoteDetailsResponseById(
            selectedQuoteId: tSelectedId));
        expect(result, equals(Right(tQuotesDetailsEntity)));
      });
    });
  });
}
