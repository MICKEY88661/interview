import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:trident_interview/data/factory/course_factory.dart';
import 'package:trident_interview/data/model/course_model.dart';

void main() {
  var data = {"id": 1, "teacherId": 1, "name": "Twimm", "content": "5-500 - Metal Fabrications", "weekDay": 1, "startTime": "2:10", "endTime": "20:49"};
  var courseFactory = CourseFactory();

  test('CourseModel.fromJson', () {
    var c = CourseModel.fromJson(data);
    expect(c.endTime, "20:49");
  });

  test('CourseFactory.create', () {
    var model = CourseModel.fromJson(data);
    var c = courseFactory.create(model);
    expect(c.endTime, const TimeOfDay(hour: 20, minute: 49));
  });
}
