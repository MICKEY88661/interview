import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:trident_interview/data/local_teacher_repo.dart';
import 'package:trident_interview/presenation/teacher_list.dart';

final loadFakeDataCall = FutureProvider.autoDispose((ref) async {
  final repository = ref.watch(localTeacherRepositoryProvider);
  await repository.loadFakeData();
  await Future.delayed(Durations.extralong1);
});

class MyHomePage extends ConsumerWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: ref.watch(loadFakeDataCall).when(
          data: (_) {
            return const TeacherList();
          },
          loading: () {
            return const CircularProgressIndicator();
          },
          error: (err, _) {
            return Text('Error: $err');
          },
        ),
      ),
    );
  }
}
