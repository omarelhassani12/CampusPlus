import 'package:flutter/material.dart';
import 'package:school_app/utils/colors.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [ColorsApp.whiteClr, ColorsApp.whiteClr],
          ),
        ),
        child: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() {
              _currentPageIndex = index;
            });
          },
          children: [
            PageContent(
              // iconnext: Icons.school,
              iconback: Icons.science,
              text: 'Welcome to School App',
              buttonText: 'Next',
              onPressed: () {
                _pageController.animateToPage(
                  1,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );
              },
            ),
            PageContent(
              // iconnext: Icons.assignment,
              text: 'Page 2',
              buttonText: 'Next',
              onPressed: () {
                // Handle button press for page 2
                _pageController.nextPage(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );
              },
              iconback: Icons.assignment,
            ),
            PageContent(
              // iconnext: Icons.person,
              text: 'Page 3',
              buttonText: 'Finish',
              onPressed: () {
                // Handle button press for page 3
              },
              iconback: Icons.person,
            ),
          ],
        ),
      ),
    );
  }
}

class PageContent extends StatelessWidget {
  final IconData iconback;
  final String text;
  final String buttonText;
  final VoidCallback onPressed;

  const PageContent({
    Key? key,
    required this.iconback,
    required this.text,
    required this.buttonText,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ClipPath(
          clipper: HalfCircleClipper(),
          child: Container(
            height: 420,
            color: ColorsApp.mainClr,
          ),
        ),
        Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: ColorsApp.whiteClr,
              ),
              width: double.infinity,
              height: 200,
              child: Column(
                children: [
                  Text(
                    text,
                    style: TextStyle(
                      color: ColorsApp.blackClr,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: onPressed,
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.blue.shade900,
                      backgroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40, vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: Text(
                      buttonText,
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class HalfCircleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, 0);
    path.lineTo(0, size.height);
    path.quadraticBezierTo(
        size.width / 2, size.height * 0.9, size.width, size.height);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}




// class WelcomeScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         width: double.infinity,
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             begin: Alignment.topCenter,
//             end: Alignment.bottomCenter,
//             colors: [Colors.blue.shade900, Colors.blue.shade300],
//           ),
//         ),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Icon(
//               Icons.school,
//               size: 80,
//               color: Colors.white,
//             ),
//             SizedBox(height: 20),
//             Text(
//               'Welcome to School App',
//               style: TextStyle(
//                 color: Colors.white,
//                 fontSize: 24,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () {
//                 // Handle button press
//               },
//               child: Text(
//                 'Get Started',
//                 style: TextStyle(
//                   fontSize: 16,
//                 ),
//               ),
//               style: ElevatedButton.styleFrom(
//                 foregroundColor: Colors.blue.shade900,
//                 backgroundColor: Colors.white,
//                 padding: EdgeInsets.symmetric(horizontal: 40, vertical: 12),
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(30),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:school_app/utils/colors.dart';

// class WelcomeScreen extends StatefulWidget {
//   const WelcomeScreen({super.key});

//   @override
//   _WelcomeScreenState createState() => _WelcomeScreenState();
// }

// class _WelcomeScreenState extends State<WelcomeScreen> {
//   final PageController _pageController = PageController(initialPage: 0);
//   int _currentPageIndex = 0;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // appBar: AppBar(
//       //   backgroundColor: Colors.blue.shade900,
//       //   title: const Text(
//       //     'School App',
//       //     style: TextStyle(color: Colors.white),
//       //   ),
//       //   centerTitle: true,
//       //   elevation: 0,
//       //   // actions: [
//       //   //   if (_currentPageIndex == 0)
//       //   //     IconButton(
//       //   //       icon: Icon(Icons.arrow_forward),
//       //   //       onPressed: () {
//       //   //         _pageController.animateToPage(
//       //   //           2,
//       //   //           duration: Duration(milliseconds: 300),
//       //   //           curve: Curves.easeInOut,
//       //   //         );
//       //   //       },
//       //   //     ),
//       //   //   if (_currentPageIndex == 1)
//       //   //     Row(
//       //   //       children: [
//       //   //         IconButton(
//       //   //           icon: Icon(Icons.arrow_back),
//       //   //           onPressed: () {
//       //   //             _pageController.previousPage(
//       //   //               duration: Duration(milliseconds: 300),
//       //   //               curve: Curves.easeInOut,
//       //   //             );
//       //   //           },
//       //   //         ),
//       //   //         IconButton(
//       //   //           icon: Icon(Icons.arrow_forward),
//       //   //           onPressed: () {
//       //   //             _pageController.animateToPage(
//       //   //               2,
//       //   //               duration: Duration(milliseconds: 300),
//       //   //               curve: Curves.easeInOut,
//       //   //             );
//       //   //           },
//       //   //         ),
//       //   //       ],
//       //   //     ),
//       //   // ],
//       // ),
//       body: Container(
//         width: double.infinity,
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             begin: Alignment.topCenter,
//             end: Alignment.bottomCenter,
//             colors: [ColorsApp.topClr, ColorsApp.bottomClr],
//           ),
//         ),
//         child: PageView(
//           controller: _pageController,
//           onPageChanged: (index) {
//             setState(() {
//               _currentPageIndex = index;
//             });
//           },
//           children: [
//             PageContent(
//               // iconnext: Icons.school,
//               iconback: Icons.science,
//               text: 'Welcome to School App',
//               buttonText: 'Next',
//               onPressed: () {
//                 _pageController.animateToPage(
//                   1,
//                   duration: const Duration(milliseconds: 300),
//                   curve: Curves.easeInOut,
//                 );
//               },
//             ),
//             PageContent(
//               // iconnext: Icons.assignment,
//               text: 'Page 2',
//               buttonText: 'Next',
//               onPressed: () {
//                 // Handle button press for page 2
//                 _pageController.nextPage(
//                   duration: const Duration(milliseconds: 300),
//                   curve: Curves.easeInOut,
//                 );
//               },
//               iconback: Icons.assignment,
//             ),
//             PageContent(
//               // iconnext: Icons.person,
//               text: 'Page 3',
//               buttonText: 'Finish',
//               onPressed: () {
//                 // Handle button press for page 3
//               },
//               iconback: Icons.person,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class PageContent extends StatelessWidget {
//   final IconData iconback;
//   final String text;
//   final String buttonText;
//   final VoidCallback onPressed;

//   const PageContent({
//     Key? key,
//     required this.iconback,
//     required this.text,
//     required this.buttonText,
//     required this.onPressed,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       crossAxisAlignment: CrossAxisAlignment.center,
//       children: [
//         ClipPath(
//           clipper: HalfCircleClipper(),
//           child: Container(
//             height: 400,
//             color: Colors.white,
//           ),
//         ),
//         Stack(
//           alignment: Alignment.bottomCenter,
//           children: [
//             Container(
//               decoration: BoxDecoration(
//                 shape: BoxShape.circle,
//                 color: ColorsApp.whiteClr,
//               ),
//               width: double.infinity,
//               height: 200,
//               child: Column(
//                 children: [
//                   Text(
//                     text,
//                     style: const TextStyle(
//                       color: Colors.white,
//                       fontSize: 24,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   ElevatedButton(
//                     onPressed: onPressed,
//                     style: ElevatedButton.styleFrom(
//                       foregroundColor: Colors.blue.shade900,
//                       backgroundColor: Colors.white,
//                       padding: const EdgeInsets.symmetric(
//                           horizontal: 40, vertical: 12),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(30),
//                       ),
//                     ),
//                     child: Text(
//                       buttonText,
//                       style: const TextStyle(
//                         fontSize: 16,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ],
//     );
//   }
// }

// class HalfCircleClipper extends CustomClipper<Path> {
//   @override
//   Path getClip(Size size) {
//     final path = Path();
//     path.lineTo(0, 0);
//     path.lineTo(0, size.height);
//     path.quadraticBezierTo(
//         size.width / 2, size.height * 0.9, size.width, size.height);
//     path.lineTo(size.width, 0);
//     path.close();
//     return path;
//   }

//   @override
//   bool shouldReclip(CustomClipper<Path> oldClipper) {
//     return false;
//   }
// }

// // class WelcomeScreen extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       body: Container(
// //         width: double.infinity,
// //         decoration: BoxDecoration(
// //           gradient: LinearGradient(
// //             begin: Alignment.topCenter,
// //             end: Alignment.bottomCenter,
// //             colors: [Colors.blue.shade900, Colors.blue.shade300],
// //           ),
// //         ),
// //         child: Column(
// //           mainAxisAlignment: MainAxisAlignment.center,
// //           crossAxisAlignment: CrossAxisAlignment.center,
// //           children: [
// //             Icon(
// //               Icons.school,
// //               size: 80,
// //               color: Colors.white,
// //             ),
// //             SizedBox(height: 20),
// //             Text(
// //               'Welcome to School App',
// //               style: TextStyle(
// //                 color: Colors.white,
// //                 fontSize: 24,
// //                 fontWeight: FontWeight.bold,
// //               ),
// //             ),
// //             SizedBox(height: 20),
// //             ElevatedButton(
// //               onPressed: () {
// //                 // Handle button press
// //               },
// //               child: Text(
// //                 'Get Started',
// //                 style: TextStyle(
// //                   fontSize: 16,
// //                 ),
// //               ),
// //               style: ElevatedButton.styleFrom(
// //                 foregroundColor: Colors.blue.shade900,
// //                 backgroundColor: Colors.white,
// //                 padding: EdgeInsets.symmetric(horizontal: 40, vertical: 12),
// //                 shape: RoundedRectangleBorder(
// //                   borderRadius: BorderRadius.circular(30),
// //                 ),
// //               ),
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }
