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
    });
  }

  void toggleSelectAll() {
    setState(() {
      selectAll = !selectAll;
      selectedUsers = List.generate(20, (index) => selectAll);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorsApp.mainClr,
        title: const Text('User Management'),
        centerTitle: true,
        elevation: 0,
      ),
      endDrawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              leading: Icon(Icons.person_add, color: ColorsApp.blueClr),
              title: Text(
                'Add User',
                style: TextStyle(color: ColorsApp.blueClr),
              ),
              onTap: () {
                // Handle Add User action
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
                  // Handle Delete Selected Users action
                  selectedUsers = List.generate(20, (index) => false);
                });
                Navigator.pop(context); // Close the drawer
              },
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: SingleChildScrollView(
                child: DataTableTheme(
                  data: DataTableThemeData(
                    headingRowColor: MaterialStateColor.resolveWith(
                      (states) => ColorsApp.mainClr,
                    ),
                    dataRowColor: MaterialStateColor.resolveWith(
                      (states) => Colors.white,
                    ),
                    dataTextStyle: TextStyle(color: Colors.black),
                    headingTextStyle: TextStyle(
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
                            ),
                            Text('Avatar'),
                          ],
                        ),
                      ),
                      DataColumn(label: Text('First Name')),
                      DataColumn(label: Text('Email')),
                      DataColumn(label: Text('Actions')),
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
                              icon: Icon(
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



// import 'package:flutter/material.dart';
// import 'package:school_app/utils/colors.dart';

// class AdminUsersScreen extends StatefulWidget {
//   const AdminUsersScreen({Key? key}) : super(key: key);

//   @override
//   _AdminUsersScreenState createState() => _AdminUsersScreenState();
// }

// class _AdminUsersScreenState extends State<AdminUsersScreen> {
//   bool isDrawerOpen = false;
//   List<bool> selectedUsers = List.generate(10, (index) => false);

//   void toggleDrawer() {
//     setState(() {
//       isDrawerOpen = !isDrawerOpen;
//     });
//   }

//   void toggleSelectedUser(int index) {
//     setState(() {
//       selectedUsers[index] = !selectedUsers[index];
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: ColorsApp.mainClr,
//         title: const Text('User Management'),
//       ),
//       drawer: Drawer(
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
//               leading: Icon(Icons.delete, color: Colors.red),
//               title: Text(
//                 'Delete Selected Users',
//                 style: TextStyle(color: Colors.red),
//               ),
//               onTap: () {
//                 setState(() {
//                   // Handle Delete Selected Users action
//                   selectedUsers = List.generate(10, (index) => false);
//                 });
//                 Navigator.pop(context); // Close the drawer
//               },
//             ),
//           ],
//         ),
//       ),
//       body: Column(
//         children: [
//           const SizedBox(height: 20),
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
//                     dataTextStyle: TextStyle(color: Colors.black),
//                     headingTextStyle: TextStyle(
//                       color: Colors.white,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   child: DataTable(
//                     columns: [
//                       DataColumn(label: Text('First Name')),
//                       DataColumn(label: Text('Email')),
//                       DataColumn(label: Text('Actions')),
//                     ],
//                     rows: List.generate(
//                       10,
//                       (index) => DataRow(
//                         onSelectChanged: (selected) {
//                           toggleSelectedUser(index);
//                         },
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
//                             IconButton(
//                               icon: Icon(
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

//   void toggleDrawer() {
//     setState(() {
//       isDrawerOpen = !isDrawerOpen;
//     });
//   }

//   void toggleSelectedUser(int index) {
//     setState(() {
//       selectedUsers[index] = !selectedUsers[index];
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
//           const SizedBox(height: 20),
//           Expanded(
//             child: SingleChildScrollView(
//               scrollDirection: Axis.horizontal,
//               child: SingleChildScrollView(
//                 child: DataTable(
//                   columns: [
//                     DataColumn(
//                       label: Checkbox(
//                         value: selectedUsers.every((selected) => selected),
//                         onChanged: (value) {
//                           setState(() {
//                             selectedUsers =
//                                 List.generate(20, (index) => value!);
//                           });
//                         },
//                       ),
//                     ),
//                     DataColumn(label: Text('Avatar')),
//                     DataColumn(label: Text('First Name')),
//                     DataColumn(label: Text('Last Name')),
//                     DataColumn(label: Text('Actions')),
//                   ],
//                   rows: List.generate(
//                     20,
//                     (index) => DataRow(
//                       cells: [
//                         DataCell(
//                           Checkbox(
//                             value: selectedUsers[index],
//                             onChanged: (value) {
//                               toggleSelectedUser(index);
//                             },
//                           ),
//                         ),
//                         DataCell(
//                           CircleAvatar(
//                             backgroundColor: ColorsApp.mainClr,
//                             child: Icon(
//                               Icons.person,
//                               color: ColorsApp.whiteClr,
//                             ),
//                           ),
//                         ),
//                         DataCell(
//                           Text('User ${index + 1}'),
//                         ),
//                         DataCell(
//                           Text('user${index + 1}'),
//                         ),
//                         DataCell(
//                           IconButton(
//                             icon: Icon(
//                               Icons.delete,
//                               color: Colors.red,
//                             ),
//                             onPressed: () {},
//                           ),
//                         ),
//                       ],
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
