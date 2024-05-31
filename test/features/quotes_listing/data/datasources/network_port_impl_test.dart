import 'dart:io';

import 'package:common/infrastructure-layer/utils/network/network_info.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:retrofit/retrofit.dart';
import 'package:srijan_technologies_assessment/behaviour-layer/data/out/network_port.dart';
import 'package:srijan_technologies_assessment/infrastructure-layer/model/response/quotes/quote_details_response.dart';
import 'package:srijan_technologies_assessment/infrastructure-layer/model/response/quotes/quotes_list_response.dart';
import 'package:srijan_technologies_assessment/infrastructure-layer/network_adapter.dart';
import 'package:srijan_technologies_assessment/infrastructure-layer/service/retrofit_service.dart';
import 'package:dio/dio.dart' as dio;

import 'network_port_impl_test.mocks.dart';

@GenerateNiceMocks([MockSpec<RetrofitService>(), MockSpec<NetworkInfo>()])
void main() {
  late MockRetrofitService retrofitService;
  late MockNetworkInfo networkInfo;
 // late NetworkPort networkAdapter;

  setUp(() {
    retrofitService = MockRetrofitService();
    networkInfo = MockNetworkInfo();
    //networkAdapter = NetworkAdapter(retrofitService, networkInfo);
  });

  const tLimit = 1;
  final HttpResponse<List<QuotesListingResponse>> quoteListingSuccessResponse =
      HttpResponse<List<QuotesListingResponse>>(
    <QuotesListingResponse>[
      QuotesListingResponse(
          id: 't7L2YkK_2QWr',
          content: "As you think, so shall you become.",
          author: 'Bruce Lee'),
    ],
    dio.Response<dynamic>(
      statusCode: HttpStatus.ok,
      requestOptions: dio.RequestOptions(path: ''),
    ),
  );

  final HttpResponse<QuoteDetailsResponse> quoteDetailsSuccessResponse =
      HttpResponse<QuoteDetailsResponse>(
    QuoteDetailsResponse(
        id: 't7L2YkK_2QWr',
        content: "As you think, so shall you become.",
        author: 'Bruce Lee'),
    dio.Response<dynamic>(
      statusCode: HttpStatus.ok,
      requestOptions: dio.RequestOptions(path: ''),
    ),
  );

  group('get quote apis response', () {
    test('success case for quote listing api', () async {
      /// arrange
      when(retrofitService.getQuotesResponse(tLimit)).thenAnswer(
        (_) async => quoteListingSuccessResponse,
      );
      expect(quoteListingSuccessResponse.response.statusCode, 200);
    });


    test('success case for quote details api', () async {
      /// arrange
      when(retrofitService.getQuoteDetailsResponse('t7L2YkK_2QWr')).thenAnswer(
        (_) async => quoteDetailsSuccessResponse,
      );
      expect(quoteDetailsSuccessResponse.response.statusCode, 200);
    });
  });
}
