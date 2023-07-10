import 'package:flutter/material.dart';
import 'package:school_app/screens/authentication/choose_role.dart';
import 'package:school_app/utils/colors.dart';
import 'package:carousel_slider/carousel_slider.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final PageController _pageController = PageController(initialPage: 0);
  int currentPageIndex = 0;

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
              currentPageIndex = index;
            });
          },
          children: [
            PageContent(
              icon: Icons.explore,
              texttitle: 'Welcome to our learning platform!',
              textcontent:
                  'Explore a diverse collection of educational courses tailored for your academic growth and personal development.',
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
              icon: Icons.lightbulb_outline,
              texttitle: 'Unlock the world of knowledge!',
              textcontent:
                  'Immerse yourself in a learning journey that expands your horizons and enhances your skills.',
              buttonText: 'Next',
              onPressed: () {
                _pageController.nextPage(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );
              },
            ),
            PageContent(
              icon: Icons.school,
              texttitle: 'Embark on a journey of lifelong learning!',
              textcontent:
                  'Discover new subjects, acquire valuable knowledge, and empower yourself for success.',
              buttonText: 'Start',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const RoleSelectionPage(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class PageContent extends StatelessWidget {
  final IconData icon;
  final String texttitle;
  final String textcontent;
  final String buttonText;
  final VoidCallback onPressed;

  const PageContent({
    Key? key,
    required this.icon,
    required this.buttonText,
    required this.onPressed,
    required this.texttitle,
    required this.textcontent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Stack(
          children: [
            ClipPath(
              clipper: HalfCircleClipper(),
              child: Container(
                height: MediaQuery.of(context).size.height / 2,
                color: ColorsApp.mainClr,
              ),
            ),
            Positioned.fill(
              child: Center(
                child: Icon(
                  icon,
                  size: 80,
                  color: ColorsApp.whiteClr,
                ),
              ),
            ),
          ],
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0),
            child: SizedBox(
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 1,
                    child: CarouselSlider(
                      options: CarouselOptions(
                        height: 10,
                        enlargeCenterPage: false,
                        autoPlay: false,
                        aspectRatio: 1.0,
                        onPageChanged: (index, _) {},
                      ),
                      items: List.generate(
                        3,
                        (index) => _buildDotIndicator(index),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Expanded(
                    flex: 1,
                    child: Center(
                      child: Text(
                        texttitle,
                        style: TextStyle(
                          color: ColorsApp.mainClr,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  const SizedBox(height: 25),
                  Expanded(
                    flex: 1,
                    child: Center(
                      child: Text(
                        textcontent,
                        style: TextStyle(
                          color: ColorsApp.greyClr,
                          fontSize: 15,
                          fontWeight: FontWeight.normal,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  const SizedBox(height: 50),
                  SizedBox(
                    width: 250,
                    child: ElevatedButton(
                      onPressed: onPressed,
                      style: ElevatedButton.styleFrom(
                        foregroundColor: ColorsApp.whiteClr,
                        backgroundColor: ColorsApp.mainClr,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 40,
                          vertical: 12,
                        ),
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
                  ),
                  const SizedBox(height: 100),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDotIndicator(int index) {
    final Color dotColor = index == 0 ? ColorsApp.mainClr : ColorsApp.greyClr;
    return Container(
      width: 8,
      height: 8,
      margin: const EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: dotColor,
      ),
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
