import 'package:flutter/material.dart';
import 'package:school_app/models/teacher.dart';

import '../../utils/colors.dart';
import '../../widgets/link_button.dart';
import 'teachers/courses_live_screen.dart';
import 'teachers/courses_pdf_screen.dart';
import 'teachers/courses_videos_screen.dart';
import 'teachers/courses_students_screen.dart';

class TeacherDetailsScreen extends StatefulWidget {
  final Teacher teacher;

  const TeacherDetailsScreen({Key? key, required this.teacher})
      : super(key: key);

  @override
  State<TeacherDetailsScreen> createState() => _TeacherDetailsScreenState();
}

class _TeacherDetailsScreenState extends State<TeacherDetailsScreen> {
  int _currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Teacher Details',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: ColorsApp.mainClr,
        elevation: 0,
      ),
      body: Column(
        children: [
          // First Half: 30%
          Expanded(
            flex: 3,
            child: Container(
              color: Colors.grey[200],
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    color: ColorsApp.accentClr,
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      children: [
                        CircleAvatar(
                          backgroundImage: AssetImage(widget.teacher.imageUrl),
                          backgroundColor: ColorsApp.whiteClr,
                          radius: 40,
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.teacher.name,
                                style: const TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Row(
                                children: [
                                  Text(
                                    widget.teacher.subject,
                                    style: const TextStyle(
                                      fontSize: 18,
                                      color: Colors.white,
                                    ),
                                  ),
                                  const Spacer(),
                                  Text(
                                    '${widget.teacher.courseCount} Courses',
                                    style: const TextStyle(
                                      fontSize: 18,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        right: 16.0, left: 16.0, top: 8.0),
                    child: Container(
                      color: ColorsApp.whiteClr,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            LinkButton(
                              onPressed: () {
                                setState(() {
                                  _currentPageIndex = 0;
                                });
                              },
                              title: 'Watch Videos',
                              isSelected: _currentPageIndex == 0,
                            ),
                            const SizedBox(width: 5),
                            LinkButton(
                              onPressed: () {
                                setState(() {
                                  _currentPageIndex = 1;
                                });
                              },
                              title: 'Live Videos',
                              isSelected: _currentPageIndex == 1,
                            ),
                            const SizedBox(width: 5),
                            LinkButton(
                              title: 'View Courses PDF',
                              isSelected: _currentPageIndex == 2,
                              onPressed: () {
                                setState(() {
                                  _currentPageIndex = 2;
                                });
                              },
                            ),
                            const SizedBox(width: 5),
                            LinkButton(
                              title: 'View Students',
                              onPressed: () {
                                setState(() {
                                  _currentPageIndex = 3;
                                });
                              },
                              isSelected: _currentPageIndex == 3,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Second Half: 70%
          Expanded(
            flex: 8,
            child: Container(
              color: Colors.white,
              child: _buildPage(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPage() {
    switch (_currentPageIndex) {
      case 0:
        return const VideoScreen();
      case 1:
        return LiveVideoScreen();
      case 2:
        return CoursesPdfScreen();
      case 3:
        return StudentsScreen();
      default:
        return Container();
    }
  }
}




// class _TeacherDetailsScreenState extends State<TeacherDetailsScreen> {
//   int _currentPageIndex = 0;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Teacher Details'),
//         backgroundColor: ColorsApp.mainClr,
//       ),
//       body: Column(
//         children: [
//           // First Half: 30%
//           Expanded(
//             flex: 3,
//             child: Container(
//               color: Colors.grey[200],
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Container(
//                     color: ColorsApp.accentClr,
//                     padding: EdgeInsets.all(16.0),
//                     child: Row(
//                       children: [
//                         CircleAvatar(
//                           backgroundImage: AssetImage(widget.teacher.imageUrl),
//                           backgroundColor: ColorsApp.whiteClr,
//                           radius: 40,
//                         ),
//                         SizedBox(width: 16),
//                         Expanded(
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(
//                                 widget.teacher.name,
//                                 style: TextStyle(
//                                   fontSize: 24,
//                                   fontWeight: FontWeight.bold,
//                                   color: Colors.white,
//                                 ),
//                               ),
//                               SizedBox(height: 8),
//                               Row(
//                                 children: [
//                                   Text(
//                                     widget.teacher.subject,
//                                     style: TextStyle(
//                                       fontSize: 18,
//                                       color: Colors.white,
//                                     ),
//                                   ),
//                                   Spacer(),
//                                   Text(
//                                     '${widget.teacher.courseCount} Courses',
//                                     style: TextStyle(
//                                       fontSize: 18,
//                                       color: Colors.white,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   SizedBox(height: 16),
//                   Padding(
//                     padding: EdgeInsets.only(right: 16.0, left: 16.0, top: 8.0),
//                     child: SingleChildScrollView(
//                       scrollDirection: Axis.horizontal,
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           LinkButton(
//                             onPressed: () {
//                               setState(() {
//                                 _currentPageIndex = 0;
//                               });
//                             },
//                             title: 'Watch Videos',
//                             isSelected: _currentPageIndex == 0,
//                           ),
//                           SizedBox(width: 5),
//                           LinkButton(
//                             onPressed: () {
//                               setState(() {
//                                 _currentPageIndex = 1;
//                               });
//                             },
//                             title: 'Live Videos',
//                             isSelected: _currentPageIndex == 1,
//                           ),
//                           SizedBox(width: 5),
//                           LinkButton(
//                             title: 'View Courses PDF',
//                             isSelected: _currentPageIndex == 2,
//                             onPressed: () {
//                               setState(() {
//                                 _currentPageIndex = 2;
//                               });
//                             },
//                           ),
//                           SizedBox(width: 5),
//                           LinkButton(
//                             title: 'View Students',
//                             onPressed: () {
//                               setState(() {
//                                 _currentPageIndex = 3;
//                               });
//                             },
//                             isSelected: _currentPageIndex == 3,
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           // Second Half: 70%
//           Expanded(
//             flex: 7,
//             child: Container(
//               color: Colors.white,
//               child: _buildPage(),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildPage() {
//     switch (_currentPageIndex) {
//       case 0:
//         return VideoScreen();
//       case 1:
//         return LiveVideoScreen();
//       case 2:
//         return CoursesPdfScreen();
//       case 3:
//         return StudentsScreen();
//       default:
//         return Container();
//     }
//   }
// }






// class TeacherDetailsScreen extends StatefulWidget {
//   final Teacher teacher;

//   const TeacherDetailsScreen({Key? key, required this.teacher})
//       : super(key: key);

//   @override
//   State<TeacherDetailsScreen> createState() => _TeacherDetailsScreenState();
// }

// class _TeacherDetailsScreenState extends State<TeacherDetailsScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Teacher Details'),
//         backgroundColor: ColorsApp.mainClr,
//       ),
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Container(
//             color: ColorsApp.mainClr,
//             padding: EdgeInsets.all(16.0),
//             child: Row(
//               children: [
//                 CircleAvatar(
//                   backgroundImage: AssetImage(widget.teacher.imageUrl),
//                   radius: 40,
//                 ),
//                 SizedBox(width: 16),
//                 Expanded(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         widget.teacher.name,
//                         style: TextStyle(
//                           fontSize: 24,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.white,
//                         ),
//                       ),
//                       SizedBox(height: 8),
//                       Row(children: [
//                         Text(
//                           widget.teacher.subject,
//                           style: TextStyle(
//                             fontSize: 18,
//                             color: Colors.white,
//                           ),
//                         ),
//                         Spacer(),
//                         Text(
//                           '${widget.teacher.courseCount} Courses',
//                           style: TextStyle(
//                             fontSize: 18,
//                             color: Colors.white,
//                           ),
//                         ),
//                       ]),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           SizedBox(height: 16),
//           Padding(
//             padding: EdgeInsets.only(right: 16.0, left: 16.0, top: 8.0),
//             child: SingleChildScrollView(
//               scrollDirection: Axis.horizontal,
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   LinkButton(
//                     onPressed: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => VideoScreen(),
//                         ),
//                       );
//                     },
//                     title: 'Watch Videos',
//                     isSelected: false,
//                   ),
//                   SizedBox(width: 5),
//                   LinkButton(
//                     onPressed: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => LiveVideoScreen(),
//                         ),
//                       );
//                     },
//                     title: 'Live Videos',
//                     isSelected: false,
//                   ),
//                   SizedBox(width: 5),
//                   LinkButton(
//                     title: 'View Courses PDF',
//                     isSelected: false,
//                     onPressed: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => CoursesPdfScreen(),
//                         ),
//                       );
//                     },
//                   ),
//                   SizedBox(width: 5),
//                   LinkButton(
//                     title: 'View Students',
//                     onPressed: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => StudentsScreen(),
//                         ),
//                       );
//                     },
//                     isSelected: false,
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
