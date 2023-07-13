import 'package:flutter/material.dart';
import 'package:school_app/utils/colors.dart';

import '../models/teacher.dart';

class TeacherCard extends StatelessWidget {
  final Teacher teacher;
  final bool isSelected;

  const TeacherCard({
    Key? key,
    required this.teacher,
    this.isSelected = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: isSelected ? 4 : 2,
      color: isSelected ? ColorsApp.accentClr : Colors.white,
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: AssetImage(teacher.imageUrl),
          backgroundColor: ColorsApp.whiteClr,
        ),
        title: Text(
          teacher.name,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black,
          ),
        ),
        subtitle: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              teacher.subject,
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.black,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              '${teacher.courseCount} courses uploaded',
              style: TextStyle(
                fontSize: 12,
                color: isSelected ? Colors.white : Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
