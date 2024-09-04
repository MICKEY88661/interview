// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CourseModel _$CourseModelFromJson(Map<String, dynamic> json) => CourseModel(
      id: (json['id'] as num).toInt(),
      teacherId: (json['teacherId'] as num).toInt(),
      name: json['name'] as String,
      content: json['content'] as String,
      weekDay: (json['weekDay'] as num).toInt(),
      startTime: json['startTime'] as String,
      endTime: json['endTime'] as String,
    );

Map<String, dynamic> _$CourseModelToJson(CourseModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'teacherId': instance.teacherId,
      'name': instance.name,
      'content': instance.content,
      'weekDay': instance.weekDay,
      'startTime': instance.startTime,
      'endTime': instance.endTime,
    };
