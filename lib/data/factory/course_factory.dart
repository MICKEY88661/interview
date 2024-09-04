import 'package:flutter/material.dart';
import 'package:trident_interview/data/model/course_model.dart';
import 'package:trident_interview/domain/course.dart';

class CourseFactory {
  Course create(CourseModel model) {
    return Course(
      id: model.id,
      teacherId: model.teacherId,
      name: model.name,
      content: model.content,
      weekDay: model.weekDay,
      startTime: _extractTime(model.startTime),
      endTime: _extractTime(model.endTime),
    );
  }

  TimeOfDay _extractTime(String data) {
    var times = data.split(':');
    return TimeOfDay(
      hour: int.parse(times.first),
      minute: int.parse(times.last),
    );
  }
}
