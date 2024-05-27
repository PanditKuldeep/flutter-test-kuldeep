// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quote_details_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuoteDetailsResponse _$QuoteDetailsResponseFromJson(
        Map<String, dynamic> json) =>
    QuoteDetailsResponse(
      id: json['_id'] as String? ?? '',
      content: json['content'] as String? ?? '',
      author: json['author'] as String? ?? '',
      tags:
          (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList() ??
              [],
      authorSlug: json['authorSlug'] as String? ?? '',
      length: (json['length'] as num?)?.toInt() ?? -1,
      dateAdded: json['dateAdded'] as String? ?? '',
      dateModified: json['dateModified'] as String? ?? '',
    );

Map<String, dynamic> _$QuoteDetailsResponseToJson(
        QuoteDetailsResponse instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'content': instance.content,
      'author': instance.author,
      'tags': instance.tags,
      'authorSlug': instance.authorSlug,
      'length': instance.length,
      'dateAdded': instance.dateAdded,
      'dateModified': instance.dateModified,
    };
