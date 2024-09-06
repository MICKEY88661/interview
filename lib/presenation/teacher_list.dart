import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:trident_interview/data/local_teacher_repo.dart';
import 'package:trident_interview/domain/course.dart';
import 'package:trident_interview/domain/teacher.dart';
import 'package:trident_interview/presenation/course_item.dart';
import 'package:trident_interview/presenation/course_page.dart';
import 'package:trident_interview/presenation/my_expansion_tile.dart';

final courses = FutureProvider.autoDispose.family<List<Course>, int>((ref, int tescherId) async {
  final repository = ref.watch(localTeacherRepositoryProvider);
  final courses = await repository.readAllCoursesOfTeacher(tescherId);
  return courses;
});

final teachers = FutureProvider.autoDispose<List<Teacher>>((ref) async {
  final repository = ref.watch(localTeacherRepositoryProvider);
  final teachers = await repository.readAllTeachers();
  return teachers;
});

class TeacherList extends HookConsumerWidget {
  const TeacherList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(teachers).when(
      loading: () {
        return const CircularProgressIndicator();
      },
      error: (err, stack) {
        return Text('Error: $err');
      },
      data: (teachers) {
        return ListView.builder(
          itemCount: teachers.length,
          itemBuilder: (_, i) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                child: MyExpansionTile(
                  viewModel: TeacherViewModel(
                    name: teachers[i].name,
                    role: teachers[i].title,
                  ),
                  children: ref.watch(courses(teachers[i].id)).when(
                    loading: () {
                      return [const CircularProgressIndicator()];
                    },
                    error: (err, stack) {
                      return [Text('Error: $err')];
                    },
                    data: (courses) {
                      return courses.map(
                        (course) {
                          return CourseItem(
                            courseId: course.id,
                            courseName: course.name,
                            courseDateAndTime: 'Weekday${course.weekDay}: ${course.startTime.format(context)}-${course.endTime.format(context)}',
                          );
                        },
                      ).toList();
                    },
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
