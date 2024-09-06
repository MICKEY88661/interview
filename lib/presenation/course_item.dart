import 'package:flutter/material.dart';
import 'package:trident_interview/presenation/course_page.dart';

class CourseItem extends StatelessWidget {
  final int courseId;
  final String courseName;
  final String courseDateAndTime;
  const CourseItem({
    super.key,
    required this.courseName,
    required this.courseDateAndTime,
    required this.courseId,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(courseName),
      subtitle: Text(courseDateAndTime),
      leading: const Icon(Icons.calendar_month),
      trailing: IconButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => CoursePage(courseId: courseId),
            ),
          );
        },
        icon: const Icon(Icons.chevron_right),
      ),
    );
  }
}
