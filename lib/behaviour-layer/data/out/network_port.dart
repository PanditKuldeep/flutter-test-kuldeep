import 'package:common/behaviour-layer/shared/model/network_error.dart';
import 'package:dartz/dartz.dart';
import 'package:srijan_technologies_assessment/behaviour-layer/domain/entity/quote_details_entity.dart';
import 'package:srijan_technologies_assessment/behaviour-layer/domain/entity/quotes_list_entity.dart';


abstract class NetworkPort {
  Future<Either<NetworkError, List<QuotesListingEntity>>> getQuotesResponse(int limit);

  Future<Either<NetworkError, QuoteDetailsEntity>> getQuoteDetailsResponseById({required String selectedQuoteId});
}
