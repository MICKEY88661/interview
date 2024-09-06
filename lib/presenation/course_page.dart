import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trident_interview/data/local_teacher_repo.dart';
import 'package:trident_interview/domain/course.dart';

final readCourseCall = FutureProvider.autoDispose.family<Course, int>((ref, int courseId) async {
  final repository = ref.watch(localTeacherRepositoryProvider);
  final course = await repository.readCourse(courseId);
  return course;
});

class CoursePage extends HookConsumerWidget {
  final int courseId;
  const CoursePage({super.key, required this.courseId});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(readCourseCall(courseId)).when(
      data: (course) {
        return Scaffold(
          appBar: AppBar(
            title: Text(course.name),
          ),
          body: Center(
            child: Card(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(course.content),
                  Text(course.startTime.toString()),
                  Text(course.endTime.toString()),
                ],
              ),
            ),
          ),
        );
      },
      loading: () {
        return const CircularProgressIndicator();
      },
      error: (err, _) {
        return Text('Error: $err');
      },
    );
  }
}
