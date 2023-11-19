// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'firebase_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$firebaseFirestoreHash() => r'230b9276da2e44bb1aa6b300e1ddbb2f93c422da';

/// See also [firebaseFirestore].
@ProviderFor(firebaseFirestore)
final firebaseFirestoreProvider =
    AutoDisposeProvider<FirebaseFirestore>.internal(
  firebaseFirestore,
  name: r'firebaseFirestoreProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$firebaseFirestoreHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef FirebaseFirestoreRef = AutoDisposeProviderRef<FirebaseFirestore>;
String _$userStreamHash() => r'6e4aa462d214a69369eaac6e272ed45fad78fa04';

/// See also [userStream].
@ProviderFor(userStream)
final userStreamProvider = AutoDisposeStreamProvider<List<User>>.internal(
  userStream,
  name: r'userStreamProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$userStreamHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef UserStreamRef = AutoDisposeStreamProviderRef<List<User>>;
String _$taskStreamHash() => r'4c2720c27a79c9d3bc400f9de924780d7a79df08';

/// See also [taskStream].
@ProviderFor(taskStream)
final taskStreamProvider = AutoDisposeStreamProvider<List<Task>>.internal(
  taskStream,
  name: r'taskStreamProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$taskStreamHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef TaskStreamRef = AutoDisposeStreamProviderRef<List<Task>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
