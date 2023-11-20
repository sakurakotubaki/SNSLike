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
String _$userStreamHash() => r'ea7b90799e9c9341000e33d8224584609acda9a7';

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
String _$taskStreamHash() => r'6d486ab7c4af3251137920aea59ed524e13b267d';

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
