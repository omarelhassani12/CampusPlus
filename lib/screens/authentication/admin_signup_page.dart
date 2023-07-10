import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:school_app/screens/adminscreens/admin_home_screen.dart';
import 'package:school_app/screens/authentication/signin_page.dart';
import 'package:school_app/utils/colors.dart';
import 'package:school_app/utils/form_field_validators.dart';
import 'package:school_app/widgets/app_logo.dart';
import 'package:school_app/widgets/button_widget.dart';

class AdminSignupPage extends StatefulWidget {
  const AdminSignupPage({super.key});

  @override
  State<AdminSignupPage> createState() => _AdminSignupPageState();
}

class _AdminSignupPageState extends State<AdminSignupPage> {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              ColorsApp.topClr.withOpacity(0.7),
              ColorsApp.bottomClr,
            ],
          ),
        ),
        child: Form(
          child: Center(
            child: Card(
              elevation: 8,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 30.0,
                  horizontal: 15,
                ),
                constraints: const BoxConstraints(maxWidth: 340),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const AppLogo(
                        size: 150,
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              controller: firstNameController,
                              decoration: InputDecoration(
                                labelText: 'First Name',
                                hintText: 'Enter your first name',
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: ColorsApp.mainClr,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: ColorsApp.mainClr,
                                    width: 2.0,
                                  ),
                                ),
                                labelStyle: TextStyle(
                                  color: ColorsApp.mainClr,
                                ),
                              ),
                              inputFormatters: [
                                FilteringTextInputFormatter.allow(
                                    RegExp(r'[a-zA-Z]+')),
                              ],
                              validator: FormFieldValidators.validateName,
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: TextFormField(
                              controller: lastNameController,
                              decoration: InputDecoration(
                                labelText: 'Last Name',
                                hintText: 'Enter your last name',
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: ColorsApp.mainClr,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: ColorsApp.mainClr,
                                    width: 2.0,
                                  ),
                                ),
                                labelStyle: TextStyle(
                                  color: ColorsApp.mainClr,
                                ),
                              ),
                              inputFormatters: [
                                FilteringTextInputFormatter.allow(
                                    RegExp(r'[a-zA-Z]+')),
                              ],
                              validator: FormFieldValidators.validateName,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        controller: emailController,
                        decoration: InputDecoration(
                          labelText: 'Email',
                          hintText: 'Enter your email',
                          prefixIcon: Icon(
                            Icons.email_outlined,
                            color: ColorsApp.mainClr,
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: ColorsApp.mainClr,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: ColorsApp.mainClr,
                              width: 2.0,
                            ),
                          ),
                          labelStyle: TextStyle(
                            color: ColorsApp.mainClr,
                          ),
                        ),
                        onEditingComplete: () {
                          if (!emailController.text.endsWith('@gmail.com')) {
                            setState(() {
                              emailController.text =
                                  '${emailController.text}@gmail.com';
                            });
                          }
                        },
                        validator: FormFieldValidators.validateEmail,
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        controller: phoneController,
                        keyboardType: TextInputType.phone,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(12),
                        ],
                        decoration: InputDecoration(
                          labelText: 'Phone Number',
                          hintText: 'Enter your phone number',
                          prefixIcon: Icon(
                            Icons.phone_outlined,
                            color: ColorsApp.mainClr,
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: ColorsApp.mainClr,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: ColorsApp.mainClr,
                              width: 2.0,
                            ),
                          ),
                          labelStyle: TextStyle(
                            color: ColorsApp.mainClr,
                          ),
                        ),
                        validator: FormFieldValidators.validatePhoneNumber,
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        controller: passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          hintText: 'Enter your password',
                          prefixIcon: Icon(
                            Icons.lock_outline_rounded,
                            color: ColorsApp.mainClr,
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: ColorsApp.mainClr,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: ColorsApp.mainClr,
                              width: 2.0,
                            ),
                          ),
                          labelStyle: TextStyle(
                            color: ColorsApp.mainClr,
                          ),
                        ),
                        validator: FormFieldValidators.validatePassword,
                      ),
                      const SizedBox(height: 16),
                      MainButton(
                        buttonText: "Sign Up",
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const AdminHomeScreen(),
                            ),
                          );
                        },
                      ),
                      const SizedBox(height: 16),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LoginPage(),
                            ),
                          );
                        },
                        child: Text.rich(
                          TextSpan(
                            text: 'Already have an account? ',
                            style: TextStyle(
                              fontSize: 14,
                              color: ColorsApp.mainClr,
                            ),
                            children: const [
                              TextSpan(
                                text: 'Log in',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.none,
                                ),
                              ),
                            ],
                          ),
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
    );
  }
}
