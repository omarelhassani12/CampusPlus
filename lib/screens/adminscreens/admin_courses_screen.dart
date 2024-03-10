import 'package:flutter/material.dart';
import 'package:school_app/utils/colors.dart';

import '../../models/course.dart';
import '../../widgets/course_card.dart';

class AdminCoursesScreen extends StatefulWidget {
  const AdminCoursesScreen({Key? key}) : super(key: key);

  @override
  State<AdminCoursesScreen> createState() => _AdminCoursesScreenState();
}

class _AdminCoursesScreenState extends State<AdminCoursesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Courses',
          style: TextStyle(
            color: ColorsApp.whiteClr,
          ),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: ColorsApp.mainClr,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: ColorsApp.whiteClr,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        color: ColorsApp.whiteClr,
        child: ListView.builder(
          itemCount: courses.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: CourseCard(
                course: courses[index],
                onEdit: () {
                  // Handle edit course action
                  // Navigate to edit course screen
                },
                onDelete: () {
                  // Handle delete course action
                  // Show confirmation dialog and delete the course
                },
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Handle add course action
          // Navigate to add course screen
        },
        backgroundColor: ColorsApp.accentClr,
        child: Icon(
          Icons.add,
          color: ColorsApp.whiteClr,
        ),
      ),
    );
  }
}
