import 'package:common/behaviour-layer/shared/utils/mapper/base_layer_transformer.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:srijan_technologies_assessment/behaviour-layer/domain/entity/quote_details_entity.dart';
import 'package:srijan_technologies_assessment/behaviour-layer/domain/entity/quotes_list_entity.dart';

part 'quote_details_response.g.dart';

@JsonSerializable(explicitToJson: true)
class QuoteDetailsResponse
    extends BaseLayerDataTransformer<QuoteDetailsResponse, QuoteDetailsEntity> {
  @JsonKey(name: '_id', defaultValue: "")
  final String id;
  @JsonKey(name: 'content', defaultValue: "")
  final String? content;
  @JsonKey(name: 'author', defaultValue: "")
  final String? author;
  @JsonKey(name: 'tags', defaultValue: [])
  final List<String>? tags;
  @JsonKey(name: 'authorSlug', defaultValue: "")
  final String? authorSlug;
  @JsonKey(name: 'length', defaultValue: -1)
  final int? length;
  @JsonKey(name: 'dateAdded', defaultValue: "")
  final String? dateAdded;
  @JsonKey(name: 'dateModified', defaultValue: "")
  final String? dateModified;

  QuoteDetailsResponse(
      {required this.id,
      this.content,
      this.author,
      this.tags,
      this.authorSlug,
      this.length,
      this.dateAdded,
      this.dateModified});

  factory QuoteDetailsResponse.fromJson(Map<String, dynamic> json) =>
      _$QuoteDetailsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$QuoteDetailsResponseToJson(this);

  @override
  QuoteDetailsEntity transform() {
    return QuoteDetailsEntity(
      id: id,
      content: content,
      author: author,
      tags: tags,
      authorSlug: authorSlug,
      dateAdded: dateModified,
      dateModified: dateModified,
    );
  }
}
