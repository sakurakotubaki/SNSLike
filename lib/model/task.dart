import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'task.freezed.dart';
part 'task.g.dart';

@freezed
class Task with _$Task {
  const factory Task({
    @Default('') String task,
    @Default([]) List<String> likes,
    @Default([]) List<String> comments,
  }) = _Task;

  factory Task.fromJson(Map<String, Object?> json)
      => _$TaskFromJson(json);
}
