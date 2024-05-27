// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quotes_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuotesListingResponse _$QuotesListingResponseFromJson(
        Map<String, dynamic> json) =>
    QuotesListingResponse(
      id: json['_id'] as String? ?? '',
      content: json['content'] as String? ?? '',
      author: json['author'] as String? ?? '',
    );

Map<String, dynamic> _$QuotesListingResponseToJson(
        QuotesListingResponse instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'content': instance.content,
      'author': instance.author,
    };
