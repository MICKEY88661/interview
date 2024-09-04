import 'package:flutter/material.dart';
import 'package:trident_interview/domain/student.dart';

class Course {
  final int id;
  final int teacherId;
  final String name;
  final String content;
  final int weekDay; // 1~7
  final TimeOfDay startTime;
  final TimeOfDay endTime;
  final List<Student>? students;

  Course({
    required this.id,
    required this.teacherId,
    required this.name,
    required this.content,
    required this.weekDay,
    required this.startTime,
    required this.endTime,
    this.students,
  });
}
