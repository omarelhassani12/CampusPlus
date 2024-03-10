import 'dart:math';
import 'package:flutter/material.dart';
import '../../models/user.dart';
import '../../screens/adminscreens/admin_user_details_screen.dart';
import '../../utils/colors.dart';
import '../../widgets/button_widget.dart';
import '../../widgets/text_form_field.dart';
import '../../widgets/show_confirmation_dialog.dart';

class AdminUsersScreen extends StatefulWidget {
  const AdminUsersScreen({Key? key}) : super(key: key);

  @override
  AdminUsersScreenState createState() => AdminUsersScreenState();
}

class AdminUsersScreenState extends State<AdminUsersScreen> {
  bool isDrawerOpen = false;
  List<bool> selectedUsers = List.generate(20, (index) => false);
  bool selectAll = false;

  void toggleDrawer() {
    setState(() {
      isDrawerOpen = !isDrawerOpen;
    });
  }

  void toggleSelectedUser(int index) {
    setState(() {
      selectedUsers[index] = !selectedUsers[index];
      if (!selectedUsers[index]) {
        selectAll = false;
      } else {
        selectAll = selectedUsers.every((selected) => selected == true);
      }
    });
  }

  void toggleSelectAll() {
    setState(() {
      selectAll = !selectAll;
      selectedUsers = List.generate(20, (index) => selectAll);
    });
  }

  // ignore: non_constant_identifier_names
  void AddUserModal() {
    String generatePassword() {
      String letters = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
      Random random = Random();
      String password = 'CampusPlus';
      for (int i = 0; i < 6; i++) {
        password += letters[random.nextInt(letters.length)];
      }
      return password;
    }

    String generatedPassword = generatePassword();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('New User'),
              IconButton(
                icon: const Icon(Icons.close),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
          content: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: SizedBox(
                height: 250,
                child: Column(
                  children: [
                    const MainTextFormField(
                      labelText: 'First Name',
                    ),
                    const MainTextFormField(
                      labelText: 'Last Name',
                    ),
                    const MainTextFormField(
                      labelText: 'Email',
                    ),
                    MainTextFormField(
                      labelText: 'Generated Password',
                      initialValue: generatedPassword,
                      enabled: false,
                    ),
                  ],
                ),
              ),
            ),
          ),
          actions: [
            MainButton(
              buttonText: "Save",
              onPressed: () {
                Navigator.pop(context);
              },
            )
          ],
        );
      },
    );
  }

  void navigateToUserDetails(int index) {
    User selectedUser = userList[index];

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => UserDetailsScreen(user: selectedUser),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorsApp.mainClr,
        title: const Text(
          'User Management',
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
        centerTitle: true,
        elevation: 0,
        actions: [
          if (!selectedUsers.contains(true))
            IconButton(
              icon: Icon(Icons.person_add, color: ColorsApp.whiteClr),
              onPressed: () {
                AddUserModal();
              },
            ),
        ],
      ),
      endDrawer: selectedUsers.contains(true)
          ? Drawer(
              child: ListView(
                children: [
                  ListTile(
                    leading: Icon(Icons.receipt, color: ColorsApp.blueClr),
                    title: Text(
                      'Generate Reports',
                      style: TextStyle(color: ColorsApp.blueClr),
                    ),
                    onTap: () {
                      // Handle Generate Reports action
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.delete, color: Colors.red),
                    title: const Text(
                      'Delete Selected Users',
                      style: TextStyle(color: Colors.red),
                    ),
                    onTap: () {
                      setState(() {
                        selectedUsers = List.generate(20, (index) => false);
                      });
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            )
          : null,
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: SingleChildScrollView(
                child: DataTableTheme(
                  data: DataTableThemeData(
                    headingRowColor: MaterialStateColor.resolveWith(
                      (states) => ColorsApp.accentClr,
                    ),
                    dataRowColor: MaterialStateColor.resolveWith(
                      (states) => Colors.white,
                    ),
                    dataTextStyle: const TextStyle(color: Colors.black),
                    headingTextStyle: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  child: DataTable(
                    columns: [
                      DataColumn(
                        label: Row(
                          children: [
                            Checkbox(
                              value: selectAll,
                              onChanged: (value) {
                                toggleSelectAll();
                              },
                              activeColor: selectedUsers.contains(false)
                                  ? Colors.grey
                                  : ColorsApp.mainClr,
                            ),
                            const Text('Avatar'),
                          ],
                        ),
                      ),
                      const DataColumn(label: Text('First Name')),
                      const DataColumn(label: Text('Email')),
                      const DataColumn(label: Text('Actions')),
                    ],
                    rows: List.generate(
                      10,
                      (index) => DataRow(
                        cells: [
                          DataCell(
                            GestureDetector(
                              onTap: () {
                                toggleSelectedUser(index);
                              },
                              child: CircleAvatar(
                                backgroundColor: selectedUsers[index]
                                    ? ColorsApp.mainClr
                                    : Colors.grey,
                                child: Icon(
                                  Icons.person,
                                  color: ColorsApp.whiteClr,
                                ),
                              ),
                            ),
                          ),
                          DataCell(
                            GestureDetector(
                              onTap: () {
                                navigateToUserDetails(index);
                              },
                              child: Text(userList[index].firstName),
                            ),
                          ),
                          DataCell(
                            GestureDetector(
                              onTap: () {
                                navigateToUserDetails(index);
                              },
                              child: Text(userList[index].email),
                            ),
                          ),
                          DataCell(
                            IconButton(
                              icon: const Icon(
                                Icons.delete,
                                color: Colors.red,
                              ),
                              onPressed: () {
                                showConfirmationDialog(context, "user");
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
