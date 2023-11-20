import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:task_app/provider/firebase_provider.dart';

import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  FirebaseFirestore.instance.settings = const Settings(
    persistenceEnabled: true,
  );

  await initializeDateFormatting('ja_JP', null);

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
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final users = ref.watch(userStreamProvider);
    final tasks = ref.watch(taskStreamProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Task App'),
      ),
      body: users.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stackTrace) => Center(child: Text(error.toString())),
        data: (users) => tasks.when(
          data: (tasks) {
            // 全てのタスクを一つのリストにまとめる
            final allTasks = tasks.toList();
            // タスクを作成日が新しい順に並び替える
            allTasks.sort((a, b) => (b.createdAt ?? DateTime.now())
                .compareTo(a.createdAt ?? DateTime.now()));
            return ListView.builder(
              itemCount: allTasks.length,
              itemBuilder: (context, index) {
                final task = allTasks[index];
                final user = users.firstWhere((user) => user.id == task.id);
                return SizedBox(
                  width: 200,
                  height: 200,
                  child: Card(
                    child: Column(
                      children: [
                        Text('タスクID: ${task.id}'),
                        Text('ユーザーID: ${user.id}'),
                        Text(
                            'task作成日: ${DateFormat('yyyy年MM月dd日HH時mm分', 'ja_JP').format(task.createdAt?.toLocal() ?? DateTime.now())}'),
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
            );
          },
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (error, stackTrace) => Center(child: Text(error.toString())),
        ),
      ),
    );
  }
}
