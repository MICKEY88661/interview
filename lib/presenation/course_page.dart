import 'package:flutter/material.dart';
import 'package:trident_interview/domain/course.dart';

class CoursePage extends StatelessWidget {
  final Course course;
  const CoursePage({
    super.key,
    required this.course,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(course.name),
      ),
      body: Center(
        child: Card(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(course.content),
              Text(course.startTime.toString()),
              Text(course.endTime.toString()),
            ],
          ),
        ),
      ),
    );
  }
}
