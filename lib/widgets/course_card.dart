import 'package:flutter/material.dart';
import 'package:school_app/models/course.dart';

import '../screens/adminscreens/admin_courses_details_screen.dart';

class CourseCard extends StatelessWidget {
  final Course course;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  const CourseCard({
    Key? key,
    required this.course,
    required this.onEdit,
    required this.onDelete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: GestureDetector(
          onTap: () {
            navigateToCourseDetails(context);
          },
          child: Image.asset(course.imageUrl),
        ),
        title: GestureDetector(
          onTap: () {
            navigateToCourseDetails(context);
          },
          child: Text(course.title),
        ),
        subtitle: Text(course.instructor),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: const Icon(Icons.edit),
              onPressed: onEdit,
            ),
            IconButton(
              icon: const Icon(Icons.delete),
              onPressed: onDelete,
            ),
          ],
        ),
      ),
    );
  }

  void navigateToCourseDetails(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AdminCoursesDetailsScreen(course: course),
      ),
    );
  }
}
