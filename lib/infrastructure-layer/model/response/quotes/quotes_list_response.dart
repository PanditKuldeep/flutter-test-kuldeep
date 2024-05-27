import 'package:common/behaviour-layer/shared/utils/mapper/base_layer_transformer.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:srijan_technologies_assessment/behaviour-layer/domain/entity/quotes_list_entity.dart';

part 'quotes_list_response.g.dart';

@JsonSerializable(explicitToJson: true)
class QuotesListingResponse
    extends BaseLayerDataTransformer<QuotesListingResponse, QuotesListingEntity> {
  @JsonKey(name: '_id', defaultValue: "")
  final String id;

  @JsonKey(name: 'content', defaultValue: "")
  final String? content;

  @JsonKey(name: 'author', defaultValue: "")
  final String? author;

  QuotesListingResponse({required this.id, this.content, this.author});

  factory QuotesListingResponse.fromJson(Map<String, dynamic> json) =>
      _$QuotesListingResponseFromJson(json);

  Map<String, dynamic> toJson() => _$QuotesListingResponseToJson(this);

  @override
  QuotesListingEntity transform() {
    return QuotesListingEntity(id: id, content: content, author: author);
  }
}
