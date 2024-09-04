import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:trident_interview/data/local_teacher_repo.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  late LocalTeacherRepository teacherRepo;

  group('LocalTeacherRepository', () {
    setUp(() {
      teacherRepo = LocalTeacherRepository();
    });

    test('readAllCourses', () async {
      await teacherRepo.loadFakeData();
      var results = await teacherRepo.readAllCourses();
      expect(results.length, 10);
    });

    test('readAllTeachers', () async {
      await teacherRepo.loadFakeData();
      var results = await teacherRepo.readAllTeachers();
      expect(results.length, 5);
    });

    test('readAllCoursesOfTeacher', () async {
      await teacherRepo.loadFakeData();
      var results = await teacherRepo.readAllCoursesOfTeacher(5);
      expect(results.length, 6);
    });

    test('createTeacher name is right', () async {
      var result = await teacherRepo.createTeacher(name: '123', title: 'test');
      expect(result.name, '123');
    });

    test('createTeacher read amount is right', () async {
      var oldTeacherAmount = (await teacherRepo.readAllTeachers()).length;
      await teacherRepo.createTeacher(name: '123', title: 'test');
      var newTeacherAmount = (await teacherRepo.readAllTeachers()).length;
      expect(newTeacherAmount, oldTeacherAmount + 1);
    });

    test('createCourse name is right', () async {
      var result = await teacherRepo.createCourse(
        teacherId: 1,
        name: 'english',
        content: 'is good good',
        weekDay: 6,
        startTime: const TimeOfDay(hour: 1, minute: 1),
        endTime: const TimeOfDay(hour: 1, minute: 10),
      );
      expect(result.name, 'english');
    });

    test('createCourse id is not used', () async {
      await teacherRepo.loadFakeData();
      var courseIds = (await teacherRepo.readAllCourses()).map((c) => c.id).toList();

      var result = await teacherRepo.createCourse(
        teacherId: 1,
        name: 'english',
        content: 'is good good',
        weekDay: 6,
        startTime: const TimeOfDay(hour: 1, minute: 1),
        endTime: const TimeOfDay(hour: 1, minute: 10),
      );

      expect(courseIds.any((id) => id == result.id), false);
    });
  });
}
