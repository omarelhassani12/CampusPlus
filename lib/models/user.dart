class User {
  final String firstName;
  final String lastName;
  final String email;
  final String phone;
  final String avatarImage;

  User({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
    required this.avatarImage,
  });
}

List<User> userList = [
  User(
    firstName: 'John',
    lastName: 'Doe',
    email: 'john.doe@example.com',
    phone: '123-456-7890',
    avatarImage: 'assets/images/avatar1.png',
  ),
  User(
    firstName: 'Jane',
    lastName: 'Smith',
    email: 'jane.smith@example.com',
    phone: '123-456-7890',
    avatarImage: 'assets/images/avatar2.png',
  ),
  User(
    firstName: 'Michael',
    lastName: 'Johnson',
    email: 'michael.johnson@example.com',
    phone: '123-456-7890',
    avatarImage: 'assets/images/avatar3.png',
  ),
  User(
    firstName: 'Emily',
    lastName: 'Brown',
    email: 'emily.brown@example.com',
    phone: '123-456-7890',
    avatarImage: 'assets/images/avatar4.png',
  ),
  User(
    firstName: 'David',
    lastName: 'Davis',
    email: 'david.davis@example.com',
    phone: '123-456-7890',
    avatarImage: 'assets/images/avatar5.png',
  ),
  User(
    firstName: 'Sophia',
    lastName: 'Wilson',
    email: 'sophia.wilson@example.com',
    phone: '123-456-7890',
    avatarImage: 'assets/images/avatar6.png',
  ),
  User(
    firstName: 'Oliver',
    lastName: 'Taylor',
    email: 'oliver.taylor@example.com',
    phone: '123-456-7890',
    avatarImage: 'assets/images/avatar7.png',
  ),
  User(
    firstName: 'Isabella',
    lastName: 'Anderson',
    email: 'isabella.anderson@example.com',
    phone: '123-456-7890',
    avatarImage: 'assets/images/avatar8.png',
  ),
  User(
    firstName: 'James',
    lastName: 'Thomas',
    email: 'james.thomas@example.com',
    phone: '123-456-7890',
    avatarImage: 'assets/images/avatar9.png',
  ),
  User(
    firstName: 'Ava',
    lastName: 'Martinez',
    email: 'ava.martinez@example.com',
    phone: '123-456-7890',
    avatarImage: 'assets/images/avatar10.png',
  ),
];
