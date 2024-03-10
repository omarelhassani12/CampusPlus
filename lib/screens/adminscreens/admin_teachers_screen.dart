import 'package:flutter/material.dart';
import '../../models/teacher.dart';
import '../../utils/colors.dart';
import '../../widgets/teacher_card.dart';
import 'admin_teachers_details_screen.dart';

class AdminTeachersScreen extends StatefulWidget {
  const AdminTeachersScreen({Key? key}) : super(key: key);

  @override
  _AdminTeachersScreenState createState() => _AdminTeachersScreenState();
}

class _AdminTeachersScreenState extends State<AdminTeachersScreen> {
  List<Teacher> selectedTeachers = [];

  @override
  Widget build(BuildContext context) {
    bool isAnyTeacherSelected = selectedTeachers.isNotEmpty;
    bool isMultipleTeachersSelected = selectedTeachers.length > 1;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Teachers',
          style: TextStyle(
            color: ColorsApp.whiteClr,
          ),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
        centerTitle: true,
        elevation: 0,
        backgroundColor: ColorsApp.mainClr,
        leading: isAnyTeacherSelected
            ? IconButton(
                icon: Icon(Icons.cancel_sharp),
                onPressed: () {
                  setState(() {
                    selectedTeachers.clear();
                  });
                },
              )
            : null,
        actions: [
          if (isAnyTeacherSelected && !isMultipleTeachersSelected)
            IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                // Implement delete functionality
              },
            ),
        ],
      ),
      body: ListView.builder(
        itemCount: teachers.length,
        itemBuilder: (context, index) {
          final teacher = teachers[index];
          final isSelected = selectedTeachers.contains(teacher);

          return InkWell(
            onTap: () {
              if (selectedTeachers.length <= 1) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        TeacherDetailsScreen(teacher: teacher),
                  ),
                );
              }
            },
            child: TeacherCard(
              teacher: teacher,
              isSelected: isSelected,
            ),
          );
        },
      ),
    );
  }
}
