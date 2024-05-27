import 'package:json_annotation/json_annotation.dart';

part 'error_info_entity.g.dart';

@JsonSerializable(explicitToJson: true)
class ErrorInfoEntity {
  @JsonKey(name: 'statusCode')
  int? status;
  @JsonKey(name: 'statusMessage')
  String? message;

  //
  factory ErrorInfoEntity.fromJson(Map<String, dynamic> json) =>
      _$ErrorInfoEntityFromJson(json);

  Map<String, dynamic> toJson() => _$ErrorInfoEntityToJson(this);

  ErrorInfoEntity({
    this.status,
    this.message,
  });
}
