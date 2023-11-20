import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:task_app/common/timestamp_converter.dart';

part 'task.freezed.dart';
part 'task.g.dart';

@freezed
class Task with _$Task {
  const factory Task({
    @TimestampConverter() DateTime? createdAt,
    @Default('') String id,
    @Default('') String task,
    @Default([]) List<String> likes,
    @Default([]) List<String> comments,
  }) = _Task;

  factory Task.fromJson(Map<String, Object?> json)
      => _$TaskFromJson(json);
}
