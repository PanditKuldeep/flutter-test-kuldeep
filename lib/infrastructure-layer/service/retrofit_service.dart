import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:srijan_technologies_assessment/infrastructure-layer/model/response/quotes/quote_details_response.dart';
import 'package:srijan_technologies_assessment/infrastructure-layer/model/response/quotes/quotes_list_response.dart';

part 'retrofit_service.g.dart';

@RestApi()
abstract class RetrofitService {
  factory RetrofitService(Dio dio, {String? baseUrl}) {
    return _RetrofitService(dio, baseUrl: dio.options.baseUrl);
  }

  @GET("quotes/random")
  Future<HttpResponse<List<QuotesListingResponse>>> getQuotesResponse(
      @Query("limit") int limit);

  @GET("quotes/{id}")
  Future<HttpResponse<QuoteDetailsResponse>> getQuoteDetailsResponse(
      @Path("id") String selectedQuoteId);
}
