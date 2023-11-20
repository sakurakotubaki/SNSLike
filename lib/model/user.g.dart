// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserImpl _$$UserImplFromJson(Map<String, dynamic> json) => _$UserImpl(
      createdAt:
          const TimestampConverter().fromJson(json['createdAt'] as Timestamp?),
      id: json['id'] as String? ?? '',
      name: json['name'] as String? ?? '',
    );

Map<String, dynamic> _$$UserImplToJson(_$UserImpl instance) =>
    <String, dynamic>{
      'createdAt': const TimestampConverter().toJson(instance.createdAt),
      'id': instance.id,
      'name': instance.name,
    };
