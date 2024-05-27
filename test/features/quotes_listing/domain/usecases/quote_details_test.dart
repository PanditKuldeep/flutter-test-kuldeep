import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:srijan_technologies_assessment/behaviour-layer/domain/entity/quote_details_entity.dart';
import 'package:srijan_technologies_assessment/behaviour-layer/domain/repository/quotes_repository.dart';
import 'package:srijan_technologies_assessment/behaviour-layer/domain/usecase/quote_details/quote_detail_usecase.dart';

import 'quote_details_test.mocks.dart';

@GenerateNiceMocks([MockSpec<QuotesRepository>()])
void main() {
  late QuoteDetailsUseCase useCase;
  late MockQuotesRepository mockQuotesRepository;

  setUp(() {
    mockQuotesRepository = MockQuotesRepository();
    useCase = QuoteDetailsUseCase(mockQuotesRepository);
  });

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

  test('get quote details from the repository ', () async {
    /// arrange
    when(mockQuotesRepository.getQuoteDetailsById(selectedQuoteId: tSelectedId))
        .thenAnswer((_) async => Right(tQuoteDetailsResponse));

    /// act
    final result = await useCase.execute(
        params: QuoteDetailsUseParams(selectedQuoteId: ''));

    /// assert
    expect(result, Right(tQuoteDetailsResponse));
    verify(mockQuotesRepository.getQuoteDetailsById(
            selectedQuoteId: tSelectedId))
        .called(1);
    verifyNoMoreInteractions(mockQuotesRepository);
  });
}
