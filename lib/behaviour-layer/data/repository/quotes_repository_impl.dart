import 'package:common/behaviour-layer/shared/model/network_error.dart';
import 'package:common/infrastructure-layer/utils/network/network_info.dart';
import 'package:common/infrastructure-layer/utils/network_code_and_message.dart';
import 'package:dartz/dartz.dart';
import 'package:srijan_technologies_assessment/behaviour-layer/data/out/network_port.dart';
import 'package:srijan_technologies_assessment/behaviour-layer/domain/entity/quote_details_entity.dart';
import 'package:srijan_technologies_assessment/behaviour-layer/domain/entity/quotes_list_entity.dart';
import 'package:srijan_technologies_assessment/behaviour-layer/domain/repository/quotes_repository.dart';

class QuotesRepositoryImpl extends QuotesRepository {
  final NetworkPort networkPort;
  final NetworkInfo networkInfo;

  QuotesRepositoryImpl({required this.networkPort, required this.networkInfo});

  @override
  Future<Either<NetworkError, List<QuotesListingEntity>>> getQuotesListing(
      int limit) async {
    bool isNetwork = await networkInfo.isConnected;
    if (isNetwork) {
      return networkPort.getQuotesResponse(limit);
    } else {
      return Left(
        NetworkError(
            message: NetworkCodeAndMessage.internetConnectionError,
            httpError: NetworkCodeAndMessage.unknownErrorCode,
            cause: Exception(NetworkCodeAndMessage.internetConnectionError)),
      );
    }
  }

  @override
  Future<Either<NetworkError, QuoteDetailsEntity>> getQuoteDetailsById(
      {required String selectedQuoteId}) async {
    bool isNetwork = await networkInfo.isConnected;
    if (isNetwork) {
      return networkPort.getQuoteDetailsResponseById(
          selectedQuoteId: selectedQuoteId);
    } else {
      return Left(
        NetworkError(
            message: NetworkCodeAndMessage.internetConnectionError,
            httpError: NetworkCodeAndMessage.unknownErrorCode,
            cause: Exception(NetworkCodeAndMessage.internetConnectionError)),
      );
    }
  }
}
