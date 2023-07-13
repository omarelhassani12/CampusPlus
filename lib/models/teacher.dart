class Teacher {
  final String id;
  final String name;
  final String subject;
  final String imageUrl;
  final int? courseCount;

  Teacher({
    required this.id,
    required this.name,
    required this.subject,
    required this.imageUrl,
    this.courseCount,
  });
}

final List<Teacher> teachers = [
  Teacher(
    id: '1',
    name: 'John Doe',
    subject: 'Mathematics',
    imageUrl: 'assets/images/teacher.png',
    courseCount: 5,
  ),
  Teacher(
    id: '2',
    name: 'Jane Smith',
    subject: 'Science',
    imageUrl: 'assets/images/teacher.png',
    courseCount: 3,
  ),
  Teacher(
    id: '3',
    name: 'David Johnson',
    subject: 'English',
    imageUrl: 'assets/images/teacher.png',
    courseCount: 7,
  ),
  Teacher(
    id: '4',
    name: 'Emily Brown',
    subject: 'History',
    imageUrl: 'assets/images/teacher.png',
    courseCount: 2,
  ),
  Teacher(
    id: '5',
    name: 'Michael Wilson',
    subject: 'Physics',
    imageUrl: 'assets/images/teacher.png',
    courseCount: 6,
  ),
  Teacher(
    id: '6',
    name: 'Sarah Davis',
    subject: 'Chemistry',
    imageUrl: 'assets/images/teacher.png',
    courseCount: 4,
  ),
  Teacher(
    id: '7',
    name: 'Christopher Martin',
    subject: 'Biology',
    imageUrl: 'assets/images/teacher.png',
    courseCount: 9,
  ),
  Teacher(
    id: '8',
    name: 'Jessica Thompson',
    subject: 'Computer Science',
    imageUrl: 'assets/images/teacher.png',
    courseCount: 1,
  ),
  Teacher(
    id: '9',
    name: 'Daniel Garcia',
    subject: 'Art',
    imageUrl: 'assets/images/teacher.png',
    courseCount: 8,
  ),
  Teacher(
    id: '10',
    name: 'Olivia Martinez',
    subject: 'Music',
    imageUrl: 'assets/images/teacher.png',
    courseCount: 5,
  ),
  Teacher(
    id: '11',
    name: 'Robert Wilson',
    subject: 'Geography',
    imageUrl: 'assets/images/teacher.png',
    courseCount: 3,
  ),
  Teacher(
    id: '12',
    name: 'Sophia Lopez',
    subject: 'Spanish',
    imageUrl: 'assets/images/teacher.png',
    courseCount: 7,
  ),
  Teacher(
    id: '13',
    name: 'William Davis',
    subject: 'Economics',
    imageUrl: 'assets/images/teacher.png',
    courseCount: 4,
  ),
  Teacher(
    id: '14',
    name: 'Ava Anderson',
    subject: 'Physical Education',
    imageUrl: 'assets/images/teacher.png',
    courseCount: 6,
  ),
  Teacher(
    id: '15',
    name: 'Ethan Thompson',
    subject: 'Chemistry',
    imageUrl: 'assets/images/teacher.png',
    courseCount: 2,
  ),
];
