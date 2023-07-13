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
  final List<Course> courses = [
    Course(
      id: '1',
      title: 'Mathematics',
      instructor: 'John Doe',
      duration: '3 months',
      imageUrl: 'assets/images/CampusPlus1.png',
      description: 'This course covers various mathematical topics.',
      goals: [
        'Learn algebra',
        'Understand calculus',
        'Solve complex equations'
      ],
      videoUrl: 'https://example.com/math-video',
    ),
    Course(
      id: '2',
      title: 'Science',
      instructor: 'Jane Smith',
      duration: '2 months',
      imageUrl: 'assets/images/CampusPlus1.png',
      description: 'Explore the world of science and conduct experiments.',
      goals: ['Learn physics', 'Study chemistry', 'Discover biology'],
      videoUrl: 'https://example.com/science-video',
    ),
    Course(
      id: '3',
      title: 'English',
      instructor: 'David Johnson',
      duration: '1 month',
      imageUrl: 'assets/images/CampusPlus1.png',
      description: 'Improve your English language skills.',
      goals: [
        'Enhance vocabulary',
        'Practice grammar',
        'Develop speaking skills'
      ],
      videoUrl: 'https://example.com/english-video',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Courses',
          style: TextStyle(
            color: ColorsApp.mainClr,
          ),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: ColorsApp.whiteClr,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: ColorsApp.mainClr,
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
        child: const Icon(Icons.add),
      ),
    );
  }
}
