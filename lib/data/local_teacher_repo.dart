import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trident_interview/data/factory/course_factory.dart';
import 'package:trident_interview/data/factory/teacher_factory.dart';
import 'package:trident_interview/data/model/course_model.dart';
import 'package:trident_interview/data/model/teacher_model.dart';
import 'package:trident_interview/domain/course.dart';
import 'package:trident_interview/domain/i_teacher_repo.dart';
import 'package:trident_interview/domain/teacher.dart';

final localTeacherRepositoryProvider = Provider((_) {
  return LocalTeacherRepository();
});

class LocalTeacherRepository implements ITeacherRepository {
  List<Teacher> _teachers = [];
  List<Course> _courses = [];

  Future<void> loadFakeData() async {
    final courseFactory = CourseFactory();
    final teacherFactory = TeacherFactory();

    List fakeCourses = await rootBundle.loadStructuredData('assets/fake_courses.json', (String s) async {
      return json.decode(s);
    });
    _courses = fakeCourses.map((json) => courseFactory.create(CourseModel.fromJson(json))).toList();

    List fakeTeachers = await rootBundle.loadStructuredData('assets/fake_teachers.json', (String s) async {
      return json.decode(s);
    });
    _teachers = fakeTeachers.map((json) => teacherFactory.create(TeacherModel.fromJson(json), _courses)).toList();
  }

  @override
  Future<Course> createCourse({
    required int teacherId,
    required String name,
    required String content,
    required int weekDay,
    required TimeOfDay startTime,
    required TimeOfDay endTime,
  }) async {
    late int newId;
    do {
      newId = Random().nextInt(1000);
    } while (_courses.any((c) => c.id == newId));

    final c = Course(
      id: newId,
      teacherId: teacherId,
      name: name,
      content: content,
      weekDay: weekDay,
      startTime: startTime,
      endTime: endTime,
    );

    _courses.add(c);

    return c;
  }

  @override
  Future<Teacher> createTeacher({
    required String name,
    required String title,
    Uri? avatorPath,
  }) async {
    final t = Teacher(
      id: Random().nextInt(1000),
      name: name,
      title: title,
    );

    _teachers.add(t);

    return t;
  }

  @override
  Future<void> deleteCourse(int courseId) async {
    _courses.removeWhere((c) => c.id == courseId);
  }

  @override
  Future<List<Course>> readAllCourses() async {
    return _courses;
  }

  @override
  Future<List<Course>> readAllCoursesOfTeacher(int teacherId) async {
    return _courses.where((c) => c.teacherId == teacherId).toList();
  }

  @override
  Future<List<Teacher>> readAllTeachers() async {
    return _teachers;
  }

  @override
  Future<Course> updateCourse(
    int courseId, {
    int? teacherId,
    String? name,
    String? content,
    int? weekDay,
    TimeOfDay? startTime,
    TimeOfDay? endTime,
  }) async {
    final targetCourse = _courses.firstWhere((c) => c.id == courseId);

    final updatedCourse = Course(
      id: targetCourse.id,
      teacherId: teacherId ?? targetCourse.teacherId,
      name: name ?? targetCourse.name,
      content: content ?? targetCourse.content,
      weekDay: weekDay ?? targetCourse.weekDay,
      startTime: startTime ?? targetCourse.startTime,
      endTime: endTime ?? targetCourse.endTime,
    );

    _courses.remove(targetCourse);
    _courses.add(updatedCourse);

    return updatedCourse;
  }
}
