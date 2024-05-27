import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:srijan_technologies_assessment/behaviour-layer/domain/entity/quotes_list_entity.dart';
import 'package:srijan_technologies_assessment/behaviour-layer/domain/repository/quotes_repository.dart';
import 'package:srijan_technologies_assessment/behaviour-layer/domain/usecase/quote_listing/quotes_listing_usecase.dart';
import 'quotes_listing_test.mocks.dart';

@GenerateNiceMocks([MockSpec<QuotesRepository>()])
void main() {
  late QuotesListingUseCase useCase;
  late MockQuotesRepository mockQuotesRepository;

  setUp(() {
    mockQuotesRepository = MockQuotesRepository();
    useCase = QuotesListingUseCase(mockQuotesRepository);
  });

  const tLimit = 5;
  List<QuotesListingEntity> tQuotesEntity = [
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

  test('get quotes list from the repository ', () async {
    /// arrange
    when(mockQuotesRepository.getQuotesListing(tLimit))
        .thenAnswer((_) async => Right(tQuotesEntity));

    /// act
    final result =
        await useCase.execute(params: QuotesListingUseParams(tLimit));

    /// assert
    expect(result, Right(tQuotesEntity));
    verify(mockQuotesRepository.getQuotesListing(tLimit)).called(1);
    verifyNoMoreInteractions(mockQuotesRepository);
  });

}
