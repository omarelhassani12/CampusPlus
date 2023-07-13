import 'package:flutter/material.dart';

class CourseGoalPage extends StatelessWidget {
  final List<String> goals;
  final String duration;

  CourseGoalPage({Key? key, required this.goals, required this.duration})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Duration: $duration',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16.0),
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
                Text('No goals available.'),
            ],
          ),
        ),
      ),
    );
  }
}
