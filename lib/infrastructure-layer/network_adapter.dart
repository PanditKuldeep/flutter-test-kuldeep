import 'package:common/behaviour-layer/shared/model/network_error.dart';
import 'package:common/infrastructure-layer/utils/network/network_info.dart';
import 'package:common/infrastructure-layer/utils/network_code_and_message.dart';
import 'package:common/infrastructure-layer/utils/safe_api_call.dart';
import 'package:dartz/dartz.dart';
import 'package:srijan_technologies_assessment/behaviour-layer/data/out/network_port.dart';
import 'package:srijan_technologies_assessment/behaviour-layer/domain/entity/quote_details_entity.dart';
import 'package:srijan_technologies_assessment/behaviour-layer/domain/entity/quotes_list_entity.dart';
import 'package:srijan_technologies_assessment/infrastructure-layer/service/retrofit_service.dart';

class NetworkAdapter extends NetworkPort {
  final RetrofitService retrofitService;


  NetworkAdapter({required this.retrofitService});

  @override
  Future<Either<NetworkError, List<QuotesListingEntity>>> getQuotesResponse(
      int limit) async {
    var response = await safeApiCall(retrofitService.getQuotesResponse(limit));
    return response.fold(
      (l) {
        return Left(l);
      },
      (r) => Right(
        r.data.map((e) => e.transform()).toList(),
      ),
    );
  }

  @override
  Future<Either<NetworkError, QuoteDetailsEntity>> getQuoteDetailsResponseById(
      {required String selectedQuoteId}) async {
    var response = await safeApiCall(
        retrofitService.getQuoteDetailsResponse(selectedQuoteId));
    return response.fold(
      (l) {
        return Left(l);
      },
      (r) => Right(
        r.data.transform(),
      ),
    );
  }
}
