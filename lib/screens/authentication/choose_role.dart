import 'package:flutter/material.dart';
import 'package:school_app/screens/authentication/admin_signup_page.dart';
import 'package:school_app/screens/authentication/signin_page.dart';
import 'package:school_app/utils/colors.dart';
import 'package:school_app/widgets/button_widget.dart';

class RoleSelectionPage extends StatefulWidget {
  const RoleSelectionPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _RoleSelectionPageState createState() => _RoleSelectionPageState();
}

class _RoleSelectionPageState extends State<RoleSelectionPage> {
  String? selectedRole;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsApp.primaryClr.withOpacity(0.9),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RoleOptionCard(
                role: 'Admin',
                image: 'assets/images/admin.png',
                onPressed: () {
                  setState(() {
                    selectedRole = 'Admin';
                  });
                },
                selected: selectedRole == 'Admin',
              ),
              const SizedBox(height: 60),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RoleOptionCard(
                    role: 'Teacher',
                    image: 'assets/images/teacher.png',
                    onPressed: () {
                      setState(() {
                        selectedRole = 'Teacher';
                      });
                    },
                    selected: selectedRole == 'Teacher',
                  ),
                  const SizedBox(width: 20),
                  RoleOptionCard(
                    role: 'Student',
                    image: 'assets/images/student.png',
                    onPressed: () {
                      setState(() {
                        selectedRole = 'Student';
                      });
                    },
                    selected: selectedRole == 'Student',
                  ),
                ],
              ),
              const SizedBox(height: 100),
              WhiteButton(
                buttonText: "Create Your ${selectedRole ?? ""} Account ",
                onPressed: () {
                  if (selectedRole == "Admin") {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AdminSignupPage()),
                    );
                  } else if (selectedRole == "Teacher") {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginPage()),
                    );
                  } else if (selectedRole == "Student") {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginPage()),
                    );
                  } else {
                    showDialog(
                      context: context,
                      builder: (_) {
                        return AlertDialog(
                          icon: Icon(
                            Icons.error,
                            size: 40,
                            color: ColorsApp.accentClr,
                          ),
                          title: Text(
                            "Role Not Selected",
                            style: TextStyle(color: ColorsApp.mainClr),
                          ),
                          content: const Text(
                            "Please select a role to proceed.",
                            textAlign: TextAlign.center,
                          ),
                        );
                      },
                    );
                  }
                },
              ),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginPage()),
                  );
                },
                child: Text.rich(
                  TextSpan(
                    text: 'Already have an account? ',
                    style: TextStyle(
                      fontSize: 16,
                      color: ColorsApp.whiteClr,
                    ),
                    children: const [
                      TextSpan(
                        text: 'Login',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.none,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RoleOptionCard extends StatelessWidget {
  final String role;
  final String image;
  final VoidCallback onPressed;
  final bool selected;

  const RoleOptionCard({
    Key? key,
    required this.role,
    required this.image,
    required this.onPressed,
    required this.selected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 150,
        height: 180,
        decoration: BoxDecoration(
          color: selected ? ColorsApp.mainClr : ColorsApp.whiteClr,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(image),
            ),
            Text(
              role,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: selected ? ColorsApp.whiteClr : Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
