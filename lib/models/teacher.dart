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
    name: 'Youssef Ali',
    subject: 'Mathematics',
    imageUrl: 'assets/images/teacher.png',
    courseCount: 5,
  ),
  Teacher(
    id: '2',
    name: 'Layla Clark',
    subject: 'Science',
    imageUrl: 'assets/images/teacher.png',
    courseCount: 3,
  ),
  Teacher(
    id: '3',
    name: 'Mohammed Walker',
    subject: 'English',
    imageUrl: 'assets/images/teacher.png',
    courseCount: 7,
  ),
  Teacher(
    id: '4',
    name: 'Alya Davis',
    subject: 'History',
    imageUrl: 'assets/images/teacher.png',
    courseCount: 2,
  ),
  Teacher(
    id: '5',
    name: 'Adam Wilson',
    subject: 'Physics',
    imageUrl: 'assets/images/teacher.png',
    courseCount: 6,
  ),
  Teacher(
    id: '6',
    name: 'Sara Lee',
    subject: 'Chemistry',
    imageUrl: 'assets/images/teacher.png',
    courseCount: 4,
  ),
  Teacher(
    id: '7',
    name: 'Ali Martin',
    subject: 'Biology',
    imageUrl: 'assets/images/teacher.png',
    courseCount: 9,
  ),
  Teacher(
    id: '8',
    name: 'Amina Thompson',
    subject: 'Computer Science',
    imageUrl: 'assets/images/teacher.png',
    courseCount: 1,
  ),
  Teacher(
    id: '9',
    name: 'Yousef Garcia',
    subject: 'Art',
    imageUrl: 'assets/images/teacher.png',
    courseCount: 8,
  ),
  Teacher(
    id: '10',
    name: 'Layla Martinez',
    subject: 'Music',
    imageUrl: 'assets/images/teacher.png',
    courseCount: 5,
  ),
  Teacher(
    id: '11',
    name: 'Adam Wilson',
    subject: 'Geography',
    imageUrl: 'assets/images/teacher.png',
    courseCount: 3,
  ),
  Teacher(
    id: '12',
    name: 'Sara Lopez',
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
    name: 'Alya Anderson',
    subject: 'Physical Education',
    imageUrl: 'assets/images/teacher.png',
    courseCount: 6,
  ),
  Teacher(
    id: '15',
    name: 'Adam Thompson',
    subject: 'Chemistry',
    imageUrl: 'assets/images/teacher.png',
    courseCount: 2,
  ),
];
