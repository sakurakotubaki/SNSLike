import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:task_app/model/user.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../model/task.dart';
part 'firebase_provider.g.dart';

@riverpod
FirebaseFirestore firebaseFirestore(FirebaseFirestoreRef ref) {
  return FirebaseFirestore.instance;
}

@riverpod
Stream<List<User>> userStream(UserStreamRef ref) {
  final firestore = ref.watch(firebaseFirestoreProvider);
  return firestore
      .collection('user').limit(5)
      .snapshots()
      .map((snapshot) => snapshot.docs.map((doc) => User.fromJson(doc.data())).toList());
}

@riverpod
Stream<List<Task>> taskStream(TaskStreamRef ref) {
  final firestore = ref.watch(firebaseFirestoreProvider);
  return firestore
      .collection('task').limit(5)
      .snapshots()
      .map((snapshot) => snapshot.docs.map((doc) => Task.fromJson(doc.data())).toList());
}
