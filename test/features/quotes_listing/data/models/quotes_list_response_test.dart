import 'dart:convert';

import 'package:common/behaviour-layer/shared/utils/mapper/base_layer_transformer.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:srijan_technologies_assessment/behaviour-layer/domain/entity/quotes_list_entity.dart';
import 'package:srijan_technologies_assessment/infrastructure-layer/model/response/quotes/quotes_list_response.dart';
import '../../../../fixtures/fixture_reader.dart';

void main() {
  QuotesListingResponse tNumberCheckerModel = QuotesListingResponse(
      id: "kFTTIYLRDSTd",
      content:
          "Aerodynamically the bumblebee shouldn't be able to fly, but the bumblebee doesn't know that, so it goes on flying anyway.",
      author: "Mary Kay Ash");

  test('should be a subclass of QuoteDetailsEntity', () {
    // assert
    expect(
        tNumberCheckerModel,
        isA<
            BaseLayerDataTransformer<QuotesListingResponse,
                QuotesListingEntity>>());
  });

  group('fromJson', () {
    test('should return a valid model when the JSON', () async {
      // arrange
      final Map<String, dynamic> jsonMap =
          json.decode(fixture('quotes_listing.json'));
      // act
      final result = QuotesListingResponse.fromJson(jsonMap);
      // assert
      expect(result, tNumberCheckerModel);
    });
  });

  group('toJson', () {
    test('should return a JSON map containing the proper data', () async {
      final expectedMap = {
        "_id": "kFTTIYLRDSTd",
        "content":
            "Aerodynamically the bumblebee shouldn't be able to fly, but the bumblebee doesn't know that, so it goes on flying anyway.",
        "author": "Mary Kay Ash"
      };

      // act
      final result = tNumberCheckerModel.toJson();
      // assert
      expect(result, expectedMap);
    });
  });
}
