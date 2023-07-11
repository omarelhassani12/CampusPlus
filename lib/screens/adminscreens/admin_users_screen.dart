import 'package:flutter/material.dart';
import 'package:school_app/utils/colors.dart';

class AdminUsersScreen extends StatefulWidget {
  const AdminUsersScreen({Key? key}) : super(key: key);

  @override
  _AdminUsersScreenState createState() => _AdminUsersScreenState();
}

class _AdminUsersScreenState extends State<AdminUsersScreen> {
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

  void openAddUserModal() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Add User'),
          content: SizedBox(
            height: 400, 
            child: Container(
              child: Column(
                children: [
                ],
              ),
            ),
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context); 
              },
              child: Text('Save'),
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
        backgroundColor: ColorsApp.mainClr,
        title: const Text('User Management'),
        centerTitle: true,
        elevation: 0,
        actions: [
          if (!selectedUsers.contains(true))
            IconButton(
              icon: Icon(Icons.person_add, color: ColorsApp.whiteClr),
              onPressed: () {
                openAddUserModal();
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
                      20,
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
                            Text('User ${index + 1}'),
                          ),
                          DataCell(
                            Text('user${index + 1}@gmail.com'),
                          ),
                          DataCell(
                            IconButton(
                              icon: const Icon(
                                Icons.delete,
                                color: Colors.red,
                              ),
                              onPressed: () {},
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





// class _AdminUsersScreenState extends State<AdminUsersScreen> {
//   bool isDrawerOpen = false;
//   List<bool> selectedUsers = List.generate(20, (index) => false);
//   bool selectAll = false;

//   void toggleDrawer() {
//     setState(() {
//       isDrawerOpen = !isDrawerOpen;
//     });
//   }

//   void toggleSelectedUser(int index) {
//     setState(() {
//       selectedUsers[index] = !selectedUsers[index];
//       if (!selectedUsers[index]) {
//         selectAll = false;
//       } else {
//         selectAll = selectedUsers.every((selected) => selected == true);
//       }
//     });
//   }

//   void toggleSelectAll() {
//     setState(() {
//       selectAll = !selectAll;
//       selectedUsers = List.generate(20, (index) => selectAll);
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: ColorsApp.mainClr,
//         title: const Text('User Management'),
//         centerTitle: true,
//         elevation: 0,
//       ),
//       endDrawer: Drawer(
//         child: ListView(
//           children: [
//             ListTile(
//               leading: Icon(Icons.person_add, color: ColorsApp.blueClr),
//               title: Text(
//                 'Add User',
//                 style: TextStyle(color: ColorsApp.blueClr),
//               ),
//               onTap: () {},
//             ),
//             ListTile(
//               leading: const Icon(Icons.delete, color: Colors.red),
//               title: const Text(
//                 'Delete Selected Users',
//                 style: TextStyle(color: Colors.red),
//               ),
//               onTap: () {
//                 setState(() {
//                   selectedUsers = List.generate(20, (index) => false);
//                 });
//                 Navigator.pop(context);
//               },
//             ),
//           ],
//         ),
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: SingleChildScrollView(
//               scrollDirection: Axis.horizontal,
//               child: SingleChildScrollView(
//                 child: DataTableTheme(
//                   data: DataTableThemeData(
//                     headingRowColor: MaterialStateColor.resolveWith(
//                       (states) => ColorsApp.accentClr,
//                     ),
//                     dataRowColor: MaterialStateColor.resolveWith(
//                       (states) => Colors.white,
//                     ),
//                     dataTextStyle: const TextStyle(color: Colors.black),
//                     headingTextStyle: const TextStyle(
//                       color: Colors.white,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   child: DataTable(
//                     columns: [
//                       DataColumn(
//                         label: Row(
//                           children: [
//                             Checkbox(
//                               value: selectAll,
//                               onChanged: (value) {
//                                 toggleSelectAll();
//                               },
//                               activeColor: selectedUsers.contains(false)
//                                   ? Colors.grey
//                                   : ColorsApp.mainClr,
//                             ),
//                             const Text('Avatar'),
//                           ],
//                         ),
//                       ),
//                       const DataColumn(label: Text('First Name')),
//                       const DataColumn(label: Text('Email')),
//                       const DataColumn(label: Text('Actions')),
//                     ],
//                     rows: List.generate(
//                       20,
//                       (index) => DataRow(
//                         cells: [
//                           DataCell(
//                             GestureDetector(
//                               onTap: () {
//                                 toggleSelectedUser(index);
//                               },
//                               child: CircleAvatar(
//                                 backgroundColor: selectedUsers[index]
//                                     ? ColorsApp.mainClr
//                                     : Colors.grey,
//                                 child: Icon(
//                                   Icons.person,
//                                   color: ColorsApp.whiteClr,
//                                 ),
//                               ),
//                             ),
//                           ),
//                           DataCell(
//                             Text('User ${index + 1}'),
//                           ),
//                           DataCell(
//                             Text('user${index + 1}@gmail.com'),
//                           ),
//                           DataCell(
//                             IconButton(
//                               icon: const Icon(
//                                 Icons.delete,
//                                 color: Colors.red,
//                               ),
//                               onPressed: () {},
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }









// class AdminUsersScreen extends StatefulWidget {
//   const AdminUsersScreen({Key? key}) : super(key: key);

//   @override
//   _AdminUsersScreenState createState() => _AdminUsersScreenState();
// }

// class _AdminUsersScreenState extends State<AdminUsersScreen> {
//   bool isDrawerOpen = false;
//   List<bool> selectedUsers = List.generate(20, (index) => false);
//   bool selectAll = false;

//   void toggleDrawer() {
//     setState(() {
//       isDrawerOpen = !isDrawerOpen;
//     });
//   }

//   void toggleSelectedUser(int index) {
//     setState(() {
//       selectedUsers[index] = !selectedUsers[index];
//       if (!selectedUsers[index]) {
//         selectAll = false;
//       } else {
//         selectAll = selectedUsers.every((selected) => selected == true);
//       }
//     });
//   }

//   void toggleSelectAll() {
//     setState(() {
//       selectAll = !selectAll;
//       selectedUsers = List.generate(20, (index) => selectAll);
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: ColorsApp.mainClr,
//         title: const Text('User Management'),
//         centerTitle: true,
//         elevation: 0,
//       ),
//       endDrawer: Drawer(
//         child: ListView(
//           children: [
//             ListTile(
//               leading: Icon(Icons.person_add, color: ColorsApp.blueClr),
//               title: Text(
//                 'Add User',
//                 style: TextStyle(color: ColorsApp.blueClr),
//               ),
//               onTap: () {
//                 // Handle Add User action
//               },
//             ),
//             ListTile(
//               leading: const Icon(Icons.delete, color: Colors.red),
//               title: const Text(
//                 'Delete Selected Users',
//                 style: TextStyle(color: Colors.red),
//               ),
//               onTap: () {
//                 setState(() {
//                   // Handle Delete Selected Users action
//                   selectedUsers = List.generate(20, (index) => false);
//                 });
//                 Navigator.pop(context); // Close the drawer
//               },
//             ),
//           ],
//         ),
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: SingleChildScrollView(
//               scrollDirection: Axis.horizontal,
//               child: SingleChildScrollView(
//                 child: DataTableTheme(
//                   data: DataTableThemeData(
//                     headingRowColor: MaterialStateColor.resolveWith(
//                       (states) => ColorsApp.mainClr,
//                     ),
//                     dataRowColor: MaterialStateColor.resolveWith(
//                       (states) => Colors.white,
//                     ),
//                     dataTextStyle: const TextStyle(color: Colors.black),
//                     headingTextStyle: const TextStyle(
//                       color: Colors.white,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   child: DataTable(
//                     columns: [
//                       DataColumn(
//                         label: Row(
//                           children: [
//                             Checkbox(
//                               value: selectAll,
//                               onChanged: (value) {
//                                 toggleSelectAll();
//                               },
//                             ),
//                             const Text('Avatar'),
//                           ],
//                         ),
//                       ),
//                       const DataColumn(label: Text('First Name')),
//                       const DataColumn(label: Text('Email')),
//                       const DataColumn(label: Text('Actions')),
//                     ],
//                     rows: List.generate(
//                       20,
//                       (index) => DataRow(
//                         cells: [
//                           DataCell(
//                             GestureDetector(
//                               onTap: () {
//                                 toggleSelectedUser(index);
//                               },
//                               child: CircleAvatar(
//                                 backgroundColor: selectedUsers[index]
//                                     ? ColorsApp.mainClr
//                                     : Colors.grey,
//                                 child: Icon(
//                                   Icons.person,
//                                   color: ColorsApp.whiteClr,
//                                 ),
//                               ),
//                             ),
//                           ),
//                           DataCell(
//                             Text('User ${index + 1}'),
//                           ),
//                           DataCell(
//                             Text('user${index + 1}@gmail.com'),
//                           ),
//                           DataCell(
//                             IconButton(
//                               icon: const Icon(
//                                 Icons.delete,
//                                 color: Colors.red,
//                               ),
//                               onPressed: () {},
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }


