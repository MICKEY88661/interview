import 'package:trident_interview/domain/course.dart';

class Teacher {
  final int id;
  final String name;
  final String title;
  final Uri? avatorPath;
  final List<Course>? courses;

  Teacher({
    required this.id,
    required this.name,
    required this.title,
    this.avatorPath,
    this.courses,
  });
}
