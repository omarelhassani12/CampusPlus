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
