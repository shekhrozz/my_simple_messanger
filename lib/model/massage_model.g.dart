// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'massage_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MessageModel _$$_MessageModelFromJson(Map<String, dynamic> json) =>
    _$_MessageModel(
      id: json['id'] as String?,
      userId: json['userId'] as String?,
      publishedDate: json['publishedDate'] == null
          ? null
          : DateTime.parse(json['publishedDate'] as String),
      text: json['text'] as String?,
      username: json['username'] as String?,
      readers: (json['readers'] as List<dynamic>?)
              ?.map((e) => e as String?)
              .toList() ??
          const <String?>[],
    );

Map<String, dynamic> _$$_MessageModelToJson(_$_MessageModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'publishedDate': instance.publishedDate?.toIso8601String(),
      'text': instance.text,
      'username': instance.username,
      'readers': instance.readers,
    };
