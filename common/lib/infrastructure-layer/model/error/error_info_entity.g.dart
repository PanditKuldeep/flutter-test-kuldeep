// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'error_info_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ErrorInfoEntity _$ErrorInfoEntityFromJson(Map<String, dynamic> json) =>
    ErrorInfoEntity(
      status: (json['statusCode'] as num?)?.toInt(),
      message: json['statusMessage'] as String?,
    );

Map<String, dynamic> _$ErrorInfoEntityToJson(ErrorInfoEntity instance) =>
    <String, dynamic>{
      'statusCode': instance.status,
      'statusMessage': instance.message,
    };
