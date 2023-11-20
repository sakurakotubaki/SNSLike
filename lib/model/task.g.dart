// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TaskImpl _$$TaskImplFromJson(Map<String, dynamic> json) => _$TaskImpl(
      createdAt:
          const TimestampConverter().fromJson(json['createdAt'] as Timestamp?),
      id: json['id'] as String? ?? '',
      task: json['task'] as String? ?? '',
      likes:
          (json['likes'] as List<dynamic>?)?.map((e) => e as String).toList() ??
              const [],
      comments: (json['comments'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$TaskImplToJson(_$TaskImpl instance) =>
    <String, dynamic>{
      'createdAt': const TimestampConverter().toJson(instance.createdAt),
      'id': instance.id,
      'task': instance.task,
      'likes': instance.likes,
      'comments': instance.comments,
    };
