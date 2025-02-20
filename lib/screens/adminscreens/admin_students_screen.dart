import 'dart:math';

import 'package:flutter/material.dart';
import '../../models/student.dart';
import '../../utils/colors.dart';
import '../../widgets/button_widget.dart';
import '../../widgets/show_confirmation_dialog.dart';
import '../../widgets/text_form_field.dart';

class AdminStudentsScreen extends StatefulWidget {
  const AdminStudentsScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<AdminStudentsScreen> createState() => _AdminStudentsScreenState();
}

class _AdminStudentsScreenState extends State<AdminStudentsScreen> {
  List<bool> selectedColumns = [];
  List<Student> selectedUsers = [];

  void importExcelFile() {
    selectedColumns = List.generate(9, (index) => false);

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Import Excel File'),
                  IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
              content: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CheckboxListTile(
                      title: const Text('First Name'),
                      value: selectedColumns[0],
                      onChanged: (value) {
                        setState(() {
                          selectedColumns[0] = value!;
                        });
                      },
                    ),
                    CheckboxListTile(
                      title: const Text('Last Name'),
                      value: selectedColumns[1],
                      onChanged: (value) {
                        setState(() {
                          selectedColumns[1] = value!;
                        });
                      },
                    ),
                    CheckboxListTile(
                      title: const Text('Email'),
                      value: selectedColumns[2],
                      onChanged: (value) {
                        setState(() {
                          selectedColumns[2] = value!;
                        });
                      },
                    ),
                    CheckboxListTile(
                      title: const Text('Avatar Image'),
                      value: selectedColumns[3],
                      onChanged: (value) {
                        setState(() {
                          selectedColumns[3] = value!;
                        });
                      },
                    ),
                    CheckboxListTile(
                      title: const Text('Phone'),
                      value: selectedColumns[4],
                      onChanged: (value) {
                        setState(() {
                          selectedColumns[4] = value!;
                        });
                      },
                    ),
                    CheckboxListTile(
                      title: const Text('Date of Birth'),
                      value: selectedColumns[5],
                      onChanged: (value) {
                        setState(() {
                          selectedColumns[5] = value!;
                        });
                      },
                    ),
                    CheckboxListTile(
                      title: const Text('Gender'),
                      value: selectedColumns[6],
                      onChanged: (value) {
                        setState(() {
                          selectedColumns[6] = value!;
                        });
                      },
                    ),
                    CheckboxListTile(
                      title: const Text('Enrollment Status'),
                      value: selectedColumns[7],
                      onChanged: (value) {
                        setState(() {
                          selectedColumns[7] = value!;
                        });
                      },
                    ),
                    CheckboxListTile(
                      title: const Text('Grade Level'),
                      value: selectedColumns[8],
                      onChanged: (value) {
                        setState(() {
                          selectedColumns[8] = value!;
                        });
                      },
                    ),
                  ],
                ),
              ),
              actions: [
                MainButton(
                  buttonText: 'Import',
                  onPressed: () {
                    List<int> selectedColumnIndexes = [];
                    for (int i = 0; i < selectedColumns.length; i++) {
                      if (selectedColumns[i]) {
                        selectedColumnIndexes.add(i + 1);
                      }
                    }
                    Navigator.pop(context);
                  },
                ),
              ],
            );
          },
        );
      },
    );
  }

  void addUserModal() {
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
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
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
              buttonText: 'Save',
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Student Management',
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: ColorsApp.mainClr,
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: students.length,
        itemBuilder: (BuildContext context, int index) {
          Student student = students[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage(student.avatarImage),
            ),
            title: Text('${student.firstName} ${student.lastName}'),
            subtitle: Text(student.email),
            trailing: GestureDetector(
              onLongPress: () {
                setState(() {
                  selectedUsers.add(student);
                });
              },
              child: IconButton(
                icon: const Icon(
                  Icons.delete,
                  color: Colors.red,
                ),
                onPressed: () {
                  if (selectedUsers.isEmpty) {
                    showConfirmationDialog(context, 'student');
                  } else {
                    // Delete selected users
                  }
                },
              ),
            ),
            onTap: () {},
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: ColorsApp.mainClr,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (BuildContext context) {
              return Wrap(
                children: [
                  ListTile(
                    leading: Icon(
                      Icons.file_upload,
                      color: ColorsApp.greenClr,
                    ),
                    title: const Text('Import Excel File'),
                    onTap: () {
                      Navigator.pop(context);
                      importExcelFile();
                    },
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.person_add,
                      color: ColorsApp.blueClr,
                    ),
                    title: const Text('Add Single User'),
                    onTap: () {
                      Navigator.pop(context);
                      addUserModal();
                    },
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
