import 'package:flutter/material.dart';
import 'package:school_app/utils/colors.dart';

class AdminUsersScreen extends StatelessWidget {
  const AdminUsersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorsApp.mainClr,
        title: const Text('User Management'),
        centerTitle: true,
        elevation: 0,
      ),
      endDrawer: SizedBox(
        width: 250,
        child: Drawer(
          child: ListView(
            children: [
              ListTile(
                leading: Icon(Icons.person_add, color: ColorsApp.blueClr),
                title: Text(
                  'Add User',
                  style: TextStyle(color: ColorsApp.blueClr),
                ),
                onTap: () {},
              ),
              const Divider(
                height: 2,
              ),
              ListTile(
                leading: const Icon(Icons.delete, color: Colors.red),
                title: const Text('Delete Selected Users',
                    style: TextStyle(color: Colors.red)),
                onTap: () {},
              ),
              const Divider(
                height: 2,
              ),
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: SingleChildScrollView(
                child: DataTable(
                  columns: const [
                    DataColumn(label: Text('Avatar')),
                    DataColumn(label: Text('First Name')),
                    DataColumn(label: Text('Last Name')),
                    DataColumn(label: Text('Actions')),
                  ],
                  rows: List.generate(
                    20,
                    (index) => DataRow(
                      cells: [
                        const DataCell(
                          CircleAvatar(
                            child: Icon(Icons.person),
                          ),
                        ),
                        DataCell(
                          Text('User ${index + 1}'),
                        ),
                        DataCell(
                          Text('user${index + 1}'),
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
        ],
      ),
    );
  }
}


// import 'package:flutter/material.dart';

// class AdminUsersScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Admin Users'),
//       ),
//       body: Column(
//         children: [
//           Text(
//             'User Management',
//             style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//           ),
//           SizedBox(height: 20),
//           ElevatedButton(
//             onPressed: () {},
//             child: Text('Add User'),
//           ),
//           SizedBox(height: 20),
//           Expanded(
//             child: ListView.builder(
//               itemCount: 10,
//               itemBuilder: (context, index) {
//                 return ListTile(
//                   leading: CircleAvatar(
//                     child: Icon(Icons.person),
//                   ),
//                   title: Text('User ${index + 1}'),
//                   subtitle: Text('user${index + 1}@example.com'),
//                   trailing: IconButton(
//                     icon: Icon(Icons.delete),
//                     onPressed: () {},
//                   ),
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
