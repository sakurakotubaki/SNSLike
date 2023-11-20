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
      .collection('user')
      .orderBy('createdAt', descending: true)
      .withConverter<User?>(fromFirestore: (ds, _) {
        final data = ds.data();
        final id = ds.id;

        if (data == null) {
          return null;
        }
        data['id'] = id;
        return User.fromJson(data);
      }, toFirestore: (user, _) {
        return user?.toJson() ?? {};
      })
      .snapshots()
      .map((snapshot) =>
          snapshot.docs.map((doc) => doc.data()).whereType<User>().toList());
}

@riverpod
Stream<List<Task>> taskStream(TaskStreamRef ref) {
  final firestore = ref.watch(firebaseFirestoreProvider);
  return firestore
      .collection('task')
      .orderBy('createdAt', descending: true)
      .withConverter<Task?>(fromFirestore: (ds, _) {
        final data = ds.data();
        final id = ds.id;

        if (data == null) {
          return null;
        }
        data['id'] = id;
        return Task.fromJson(data);
      }, toFirestore: (user, _) {
        return user?.toJson() ?? {};
      })
      .snapshots()
      .map((snapshot) =>
          snapshot.docs.map((doc) => doc.data()).whereType<Task>().toList());
}
