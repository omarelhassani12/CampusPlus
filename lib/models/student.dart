class Student {
  final String id;
  final String firstName;
  final String lastName;
  final String email;
  final String avatarImage;
  final String phone;
  final String dateOfBirth;
  final String gender;
  final String enrollmentStatus;
  final String gradeLevel;
  final String major;

  Student({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.avatarImage,
    required this.phone,
    required this.dateOfBirth,
    required this.gender,
    required this.enrollmentStatus,
    required this.gradeLevel,
    required this.major,
  });
}

List<Student> students = [
  Student(
    id: '1',
    firstName: 'Ali',
    lastName: 'Ahmed',
    email: 'ali.ahmed@example.com',
    avatarImage: 'assets/images/avatar1.png',
    phone: '123456789',
    dateOfBirth: '1998-05-10',
    gender: 'Male',
    enrollmentStatus: 'Enrolled',
    gradeLevel: '10th Grade',
    major: 'Science',
  ),
  Student(
    id: '2',
    firstName: 'Fatima',
    lastName: 'Ali',
    email: 'fatima.ali@example.com',
    avatarImage: 'assets/images/avatar2.png',
    phone: '987654321',
    dateOfBirth: '1999-09-15',
    gender: 'Female',
    enrollmentStatus: 'Enrolled',
    gradeLevel: '11th Grade',
    major: 'Arts',
  ),
  Student(
    id: '3',
    firstName: 'Mohammed',
    lastName: 'Hassan',
    email: 'mohammed.hassan@example.com',
    avatarImage: 'assets/images/avatar3.png',
    phone: '456789123',
    dateOfBirth: '1997-12-20',
    gender: 'Male',
    enrollmentStatus: 'Enrolled',
    gradeLevel: '12th Grade',
    major: 'Mathematics',
  ),
  Student(
    id: '4',
    firstName: 'Aisha',
    lastName: 'Omar',
    email: 'aisha.omar@example.com',
    avatarImage: 'assets/images/avatar4.png',
    phone: '321654987',
    dateOfBirth: '2000-03-05',
    gender: 'Female',
    enrollmentStatus: 'Enrolled',
    gradeLevel: '9th Grade',
    major: 'English',
  ),
  Student(
    id: '5',
    firstName: 'Mohammed',
    lastName: 'Abdelaziz',
    email: 'mohammed.abdelaziz@example.com',
    avatarImage: 'assets/images/avatar5.png',
    phone: '789123456',
    dateOfBirth: '1999-07-25',
    gender: 'Male',
    enrollmentStatus: 'Enrolled',
    gradeLevel: '11th Grade',
    major: 'History',
  ),
  Student(
    id: '6',
    firstName: 'Nour',
    lastName: 'Mohammed',
    email: 'nour.mohammed@example.com',
    avatarImage: 'assets/images/avatar6.png',
    phone: '654987321',
    dateOfBirth: '1998-09-12',
    gender: 'Female',
    enrollmentStatus: 'Enrolled',
    gradeLevel: '10th Grade',
    major: 'Science',
  ),
  Student(
    id: '7',
    firstName: 'Daniel',
    lastName: 'Anderson',
    email: 'daniel.anderson@example.com',
    avatarImage: 'assets/images/avatar7.png',
    phone: '123789456',
    dateOfBirth: '1997-11-08',
    gender: 'Male',
    enrollmentStatus: 'Enrolled',
    gradeLevel: '12th Grade',
    major: 'Mathematics',
  ),
  Student(
    id: '8',
    firstName: 'Olivia',
    lastName: 'Clark',
    email: 'olivia.clark@example.com',
    avatarImage: 'assets/images/avatar8.png',
    phone: '789456123',
    dateOfBirth: '2001-02-18',
    gender: 'Female',
    enrollmentStatus: 'Enrolled',
    gradeLevel: '9th Grade',
    major: 'English',
  ),
  Student(
    id: '9',
    firstName: 'Matthew',
    lastName: 'Walker',
    email: 'matthew.walker@example.com',
    avatarImage: 'assets/images/avatar9.png',
    phone: '321789654',
    dateOfBirth: '2000-06-29',
    gender: 'Male',
    enrollmentStatus: 'Enrolled',
    gradeLevel: '11th Grade',
    major: 'History',
  ),
  Student(
    id: '10',
    firstName: 'Sophia',
    lastName: 'Hill',
    email: 'sophia.hill@example.com',
    avatarImage: 'assets/images/avatar10.png',
    phone: '654321987',
    dateOfBirth: '1999-10-03',
    gender: 'Female',
    enrollmentStatus: 'Enrolled',
    gradeLevel: '10th Grade',
    major: 'Science',
  ),
  Student(
    id: '11',
    firstName: 'James',
    lastName: 'Garcia',
    email: 'james.garcia@example.com',
    avatarImage: 'assets/images/avatar11.png',
    phone: '789654321',
    dateOfBirth: '1998-08-15',
    gender: 'Male',
    enrollmentStatus: 'Enrolled',
    gradeLevel: '12th Grade',
    major: 'Mathematics',
  ),
  Student(
    id: '12',
    firstName: 'Ava',
    lastName: 'Lee',
    email: 'ava.lee@example.com',
    avatarImage: 'assets/images/avatar12.png',
    phone: '123456789',
    dateOfBirth: '2001-01-22',
    gender: 'Female',
    enrollmentStatus: 'Enrolled',
    gradeLevel: '9th Grade',
    major: 'English',
  ),
  Student(
    id: '13',
    firstName: 'Joseph',
    lastName: 'Lopez',
    email: 'joseph.lopez@example.com',
    avatarImage: 'assets/images/avatar13.png',
    phone: '987654321',
    dateOfBirth: '2000-04-06',
    gender: 'Male',
    enrollmentStatus: 'Enrolled',
    gradeLevel: '11th Grade',
    major: 'History',
  ),
  Student(
    id: '14',
    firstName: 'Mia',
    lastName: 'Gonzalez',
    email: 'mia.gonzalez@example.com',
    avatarImage: 'assets/images/avatar14.png',
    phone: '456789123',
    dateOfBirth: '1999-12-14',
    gender: 'Female',
    enrollmentStatus: 'Enrolled',
    gradeLevel: '10th Grade',
    major: 'Science',
  ),
  Student(
    id: '15',
    firstName: 'Benjamin',
    lastName: 'Smith',
    email: 'benjamin.smith@example.com',
    avatarImage: 'assets/images/avatar15.png',
    phone: '321654987',
    dateOfBirth: '1998-11-02',
    gender: 'Male',
    enrollmentStatus: 'Enrolled',
    gradeLevel: '12th Grade',
    major: 'Mathematics',
  ),
];
