import 'package:flutter/material.dart';
import 'package:school_app/models/user.dart';
import 'package:school_app/utils/colors.dart';

class UserDetailsScreen extends StatelessWidget {
  final User user;

  const UserDetailsScreen({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${user.firstName} ${user.lastName}\'s details'),
        elevation: 0,
        backgroundColor: ColorsApp.mainClr,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 60,
                backgroundColor: ColorsApp.mainClr,
                backgroundImage: AssetImage(user.avatarImage),
              ),
              const SizedBox(height: 20),
              const Text(
                'Name:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                '${user.firstName} ${user.lastName}',
                style: const TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 10),
              const Text(
                'Email:',
                style: TextStyle(fontSize: 16),
              ),
              Text(
                user.email,
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 20),
              Divider(
                color: Colors.grey[400],
                thickness: 1,
              ),
              const SizedBox(height: 10),
              const ListTile(
                leading: Icon(Icons.person),
                title: Text(
                  'Role:',
                  style: TextStyle(fontSize: 16),
                ),
                subtitle: Text(
                  "user.role",
                  style: TextStyle(fontSize: 16),
                ),
              ),
              const SizedBox(height: 10),
              ListTile(
                leading: const Icon(Icons.phone),
                title: Text(
                  user.phone,
                  style: const TextStyle(fontSize: 16),
                ),
              ),
              const SizedBox(height: 10),
              const ListTile(
                leading: Icon(Icons.work),
                title: Text(
                  'Specialty:',
                  style: TextStyle(fontSize: 16),
                ),
                subtitle: Text(
                  "user.specialty",
                  style: TextStyle(fontSize: 16),
                ),
              ),
              const SizedBox(height: 10),
              const ListTile(
                leading: Icon(Icons.location_on),
                title: Text(
                  'Location:',
                  style: TextStyle(fontSize: 16),
                ),
                subtitle: Text(
                  "user.location",
                  style: TextStyle(fontSize: 16),
                ),
              ),
              const SizedBox(height: 10),
              const ListTile(
                leading: Icon(Icons.calendar_today),
                title: Text(
                  'Date of Birth:',
                  style: TextStyle(fontSize: 16),
                ),
                subtitle: Text(
                  "user.dateOfBirth",
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
