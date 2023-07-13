import 'package:flutter/material.dart';
import '../../screens/adminscreens/admin_users_screen.dart';
import '../../screens/adminscreens/admin_students_screen.dart';
import '../../screens/adminscreens/admin_courses_screen.dart';
import '../../utils/colors.dart';
import '../../widgets/app_logo.dart';
import '../../widgets/button_widget.dart';
import '../../widgets/long_press_button.dart';
import '../../widgets/statistic_card.dart';
import 'admin_teachers_screen.dart';

class AdminHomeScreen extends StatefulWidget {
  const AdminHomeScreen({Key? key}) : super(key: key);

  @override
  State<AdminHomeScreen> createState() => _AdminHomeScreenState();
}

class _AdminHomeScreenState extends State<AdminHomeScreen> {
  bool isLongPressed = false;
  int selectedCardIndex = -1;
  String titleOfReport = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text(
              'CampusPlus',
              style: TextStyle(
                color: ColorsApp.mainClr,
              ),
            ),
            const Spacer(),
            const AppLogo(
              size: 80,
            ),
          ],
        ),
        elevation: 0,
        backgroundColor: ColorsApp.whiteClr,
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              color: ColorsApp.mainClr,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.admin_panel_settings,
                      size: 100,
                      color: ColorsApp.whiteClr,
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Welcome, Admin!',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 20),
                    GridView.count(
                      crossAxisCount: 4,
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 2,
                      padding: const EdgeInsets.all(10),
                      shrinkWrap: true,
                      children: [
                        LongPressButton(
                          icon: Icons.people,
                          iconColor: Colors.white,
                          backgroundColor: ColorsApp.accentClr,
                          buttonText: '20',
                          buttonTextColor: Colors.white,
                          toastBackgroundColor: ColorsApp.greyClr,
                          toastTextColor: Colors.white,
                          toastMessage: 'Users',
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const AdminUsersScreen()),
                            );
                          },
                        ),
                        LongPressButton(
                          icon: Icons.school,
                          iconColor: Colors.white,
                          backgroundColor: ColorsApp.accentClr,
                          buttonText: '15',
                          buttonTextColor: Colors.white,
                          toastBackgroundColor: ColorsApp.greyClr,
                          toastTextColor: Colors.white,
                          toastMessage: 'Students',
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const AdminStudentsScreen()),
                            );
                          },
                        ),
                        LongPressButton(
                          icon: Icons.person,
                          iconColor: Colors.white,
                          backgroundColor: ColorsApp.accentClr,
                          buttonText: '5',
                          buttonTextColor: Colors.white,
                          toastBackgroundColor: ColorsApp.greyClr,
                          toastTextColor: Colors.white,
                          toastMessage: 'Teacher',
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const AdminTeachersScreen()),
                            );
                          },
                        ),
                        LongPressButton(
                          icon: Icons.book,
                          iconColor: Colors.white,
                          backgroundColor: ColorsApp.accentClr,
                          buttonText: '12',
                          buttonTextColor: Colors.white,
                          toastBackgroundColor: ColorsApp.greyClr,
                          toastTextColor: Colors.white,
                          toastMessage: 'Courses',
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const AdminCoursesScreen()),
                            );
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Statistics and Management',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: ColorsApp.mainClr,
                      ),
                    ),
                    const SizedBox(height: 24),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedCardIndex = 0;
                              });
                            },
                            child: StatisticCard(
                              icon: Icons.people,
                              title: 'Users',
                              count: '80',
                              isSelected: selectedCardIndex == 0,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedCardIndex = 1;
                              });
                            },
                            child: StatisticCard(
                              icon: Icons.school,
                              title: 'Students',
                              count: '30',
                              isSelected: selectedCardIndex == 1,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedCardIndex = 2;
                              });
                            },
                            child: StatisticCard(
                              icon: Icons.person,
                              title: 'Teachers',
                              count: '50',
                              isSelected: selectedCardIndex == 2,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedCardIndex = 3;
                              });
                            },
                            child: StatisticCard(
                              icon: Icons.attach_money,
                              title: 'Revenue',
                              count: '\$50',
                              isSelected: selectedCardIndex == 3,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),
                    Column(
                      children: [
                        if (selectedCardIndex == 0)
                          MainButton(
                            buttonText: 'Generate Users Reports',
                            onPressed: () {
                              showModalBottomSheet(
                                context: context,
                                isScrollControlled: true,
                                builder: (BuildContext context) {
                                  return SingleChildScrollView(
                                    child: Container(
                                      padding: EdgeInsets.only(
                                        bottom: MediaQuery.of(context)
                                            .viewInsets
                                            .bottom,
                                      ),
                                      height: 200,
                                      child: const Center(
                                        child: Text('Modal Content'),
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                        if (selectedCardIndex == 1)
                          MainButton(
                            buttonText: 'Generate Students Reports',
                            onPressed: () {},
                          ),
                        if (selectedCardIndex == 2)
                          MainButton(
                            buttonText: 'Generate Teachers Reports',
                            onPressed: () {},
                          ),
                        if (selectedCardIndex == 3)
                          MainButton(
                            buttonText: 'Generate Revenue Reports',
                            onPressed: () {},
                          ),
                        if (selectedCardIndex != 0 &&
                            selectedCardIndex != 1 &&
                            selectedCardIndex != 2 &&
                            selectedCardIndex != 3)
                          MainButton(
                            buttonText: 'Generate Reports',
                            onPressed: () {
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
                                      "Reports Not Selected",
                                      style:
                                          TextStyle(color: ColorsApp.mainClr),
                                    ),
                                    content: const Text(
                                      "Please select a Reports to proceed.",
                                      textAlign: TextAlign.center,
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                      ],
                    ),

                    // ElevatedButton(
                    //   onPressed: () {
                    //     // Implement your action here
                    //   },
                    //   child: const Text('Generate Reports'),
                    // ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
