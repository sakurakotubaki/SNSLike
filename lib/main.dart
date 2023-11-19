import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_app/provider/firebase_provider.dart';

import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  FirebaseFirestore.instance.settings = const Settings(
    persistenceEnabled: true,
  );

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final users = ref.watch(userStreamProvider);
    final tasks = ref.watch(taskStreamProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Task App'),
      ),
      // Cardの中にuserのnameとtaskのtask,likes, commentsを表示する。ユーザー名を表示して、その下にtaskの情報を表示する。全てCardの中に表示する。
      body: users.when(
        data: (users) => tasks.when(
          data: (tasks) => ListView.builder(
            itemCount: users.length,
            itemBuilder: (context, index) {
              final user = users[index];
              final task = tasks[index];
              return SizedBox(
                width: 200,
                height: 150,
                child: Card(
                  child: Column(
                    children: [
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Text(user.name)),
                      const SizedBox(height: 10),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Text(task.task)),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Text('いいね ${task.likes.length.toString()}'),
                          Text('コメント ${task.comments.length.toString()}'),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (error, stackTrace) => Center(child: Text(error.toString())),
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stackTrace) => Center(child: Text(error.toString())),
      ),
    );
  }
}
