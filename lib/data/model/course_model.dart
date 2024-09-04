import 'package:json_annotation/json_annotation.dart';

part 'course_model.g.dart';

@JsonSerializable()
class CourseModel {
  final int id;
  final int teacherId;
  final String name;
  final String content;
  final int weekDay; // 1~7
  final String startTime;
  final String endTime;

  CourseModel({
    required this.id,
    required this.teacherId,
    required this.name,
    required this.content,
    required this.weekDay,
    required this.startTime,
    required this.endTime,
  });

  factory CourseModel.fromJson(Map<String, dynamic> json) => _$CourseModelFromJson(json);

  Map<String, dynamic> toJson() => _$CourseModelToJson(this);
}
