// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserModel _$$_UserModelFromJson(Map<String, dynamic> json) => _$_UserModel(
      id: json['id'] as String?,
      userCreatedDate: json['userCreatedDate'] == null
          ? null
          : DateTime.parse(json['userCreatedDate'] as String),
      userName: json['username'] as String? ?? 'user',
      email: json['email'] as String?,
      password: json['password'] as String?,
    );

Map<String, dynamic> _$$_UserModelToJson(_$_UserModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userCreatedDate': instance.userCreatedDate?.toIso8601String(),
      'username': instance.userName,
      'email': instance.email,
      'password': instance.password,
    };
