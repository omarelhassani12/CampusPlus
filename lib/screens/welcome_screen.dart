import 'package:flutter/material.dart';
import 'package:school_app/utils/colors.dart';
import 'package:carousel_slider/carousel_slider.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

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
              icon: Icons.science,
              texttitle: 'Welcome to School App',
              textcontent: 'Welcome to School App',
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
              icon: Icons.assignment,
              texttitle: 'Page 2',
              textcontent: 'Page 2',
              buttonText: 'Next',
              onPressed: () {
                _pageController.nextPage(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );
              },
            ),
            PageContent(
              icon: Icons.person,
              texttitle: 'Page 3',
              textcontent: 'Page 3',
              buttonText: 'Finish',
              onPressed: () {},
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
                height: 420,
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
                  CarouselSlider(
                    options: CarouselOptions(
                      height: 10,
                      enlargeCenterPage: false,
                      autoPlay: false,
                      aspectRatio: 1.0,
                      onPageChanged: (index, _) {},
                    ),
                    items:
                        List.generate(3, (index) => _buildDotIndicator(index)),
                  ),
                  SizedBox(height: 20),
                  Text(
                    texttitle,
                    style: TextStyle(
                      color: ColorsApp.blackClr,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    textcontent,
                    style: TextStyle(
                      color: ColorsApp.greyClr,
                      fontSize: 15,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: onPressed,
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.blue.shade900,
                      backgroundColor: Colors.white,
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
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildDotIndicator(int index) {
    final Color dotColor = index == 0 ? ColorsApp.mainClr : ColorsApp.greyClr;
    return Container(
      width: 8,
      height: 8,
      margin: EdgeInsets.symmetric(horizontal: 4),
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

