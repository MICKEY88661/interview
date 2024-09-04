import 'package:flutter/material.dart';
import 'package:trident_interview/domain/course.dart';
import 'package:trident_interview/domain/teacher.dart';

abstract class ITeacherRepository {
  Future<List<Teacher>> readAllTeachers();
  Future<List<Course>> readAllCourses();
  Future<List<Course>> readAllCoursesOfTeacher(int teacherId);
  Future<Teacher> createTeacher({
    required String name,
    required String title,
    Uri? avatorPath,
  });
  Future<Course> createCourse({
    required int teacherId,
    required String name,
    required String content,
    required int weekDay,
    required TimeOfDay startTime,
    required TimeOfDay endTime,
  });
  Future<Course> updateCourse(
    int courseId, {
    int? teacherId,
    String? name,
    String? content,
    int? weekDay,
    TimeOfDay? startTime,
    TimeOfDay? endTime,
  });
  Future<void> deleteCourse(int courseId);
}
