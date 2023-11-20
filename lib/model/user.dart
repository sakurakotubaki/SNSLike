import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

import '../common/timestamp_converter.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User {
  const factory User({
    @TimestampConverter() DateTime? createdAt,
    @Default('') String id,
    @Default('') String name,
  }) = _User;

  factory User.fromJson(Map<String, Object?> json)
      => _$UserFromJson(json);
}
