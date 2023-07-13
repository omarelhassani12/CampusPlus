class Course {
  final String id;
  final String title;
  final String instructor;
  final String duration;
  final String imageUrl;
  final String description;
  final List<String> goals;
  final String videoUrl;

  Course({
    required this.id,
    required this.title,
    required this.instructor,
    required this.duration,
    required this.imageUrl,
    required this.description,
    required this.goals,
    required this.videoUrl,
  });
}

final List<Course> courses = [
  Course(
    id: '1',
    title: 'Mathematics',
    instructor: 'John Doe',
    duration: '3 months',
    imageUrl: 'assets/images/CampusPlus1.png',
    description: 'This course covers various mathematical topics.',
    goals: ['Learn algebra', 'Understand calculus', 'Solve complex equations'],
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
