import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:trident_interview/data/local_teacher_repo.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  late LocalTeacherRepository teacherRepo;

  group('LocalTeacherRepository', () {
    teacherRepo = LocalTeacherRepository();

    test('init', () async {
      await teacherRepo.init();
    });

    test('readAllCourses', () async {
      var results = await teacherRepo.readAllCourses();
      expect(results.length, 10);
    });

    test('readAllTeachers', () async {
      var results = await teacherRepo.readAllTeachers();
      expect(results.length, 5);
    });

    test('readAllCoursesOfTeacher', () async {
      var results = await teacherRepo.readAllCoursesOfTeacher(5);
      expect(results.length, 6);
    });
  });
}
