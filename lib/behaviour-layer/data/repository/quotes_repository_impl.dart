import 'package:common/behaviour-layer/shared/model/network_error.dart';
import 'package:dartz/dartz.dart';
import 'package:srijan_technologies_assessment/behaviour-layer/data/out/network_port.dart';
import 'package:srijan_technologies_assessment/behaviour-layer/domain/entity/quote_details_entity.dart';
import 'package:srijan_technologies_assessment/behaviour-layer/domain/entity/quotes_list_entity.dart';
import 'package:srijan_technologies_assessment/behaviour-layer/domain/repository/quotes_repository.dart';

class QuotesRepositoryImpl extends QuotesRepository {
  NetworkPort networkPort;

  QuotesRepositoryImpl(this.networkPort);

  @override
  Future<Either<NetworkError, List<QuotesListingEntity>>> getQuotesListing(int limit) {
    return networkPort.getQuotesResponse(limit);
  }

  @override
  Future<Either<NetworkError, QuoteDetailsEntity>> getQuoteDetailsById(
      {required String selectedQuoteId}) {
    return networkPort.getQuoteDetailsResponseById(selectedQuoteId: selectedQuoteId);
  }
}
