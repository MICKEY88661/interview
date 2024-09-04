import 'package:json_annotation/json_annotation.dart';

part 'teacher_model.g.dart';

@JsonSerializable()
class TeacherModel {
  final int id;
  final String name;
  final String title;
  final Uri? avatorPath;

  TeacherModel({
    required this.id,
    required this.name,
    required this.title,
    this.avatorPath,
  });

  factory TeacherModel.fromJson(Map<String, dynamic> json) => _$TeacherModelFromJson(json);

  Map<String, dynamic> toJson() => _$TeacherModelToJson(this);
}
