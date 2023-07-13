import 'package:flutter/material.dart';

class CourseGoalPage extends StatelessWidget {
  final List<String> goals;

  const CourseGoalPage({Key? key, required this.goals}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (goals.isNotEmpty)
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: goals.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(goals[index]),
                    );
                  },
                )
              else
                const Text('No goals available.'),
            ],
          ),
        ),
      ),
    );
  }
}
