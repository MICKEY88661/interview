import 'package:trident_interview/data/model/teacher_model.dart';
import 'package:trident_interview/domain/course.dart';
import 'package:trident_interview/domain/teacher.dart';

class TeacherFactory {
  Teacher create(
    TeacherModel model,
    List<Course>? courses,
  ) {
    return Teacher(
      id: model.id,
      name: model.name,
      title: model.title,
      avatorPath: model.avatorPath,
      courses: courses?.where((c) => c.teacherId == model.id).toList(),
    );
  }
}
