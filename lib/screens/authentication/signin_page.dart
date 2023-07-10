import 'package:flutter/material.dart';
import 'package:school_app/screens/authentication/choose_role.dart';
import 'package:school_app/utils/colors.dart';
import 'package:school_app/widgets/button_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isPasswordVisible = false;
  bool _rememberMe = false;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
          key: _formKey,
          child: Center(
            child: Card(
              elevation: 8,
              child: Container(
                padding: const EdgeInsets.only(
                    top: 30.0, bottom: 30.0, left: 15, right: 15),
                constraints: const BoxConstraints(maxWidth: 310),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const FlutterLogo(size: 100),
                      _gap(),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Text(
                          "Welcome Back!",
                          style:
                              TextStyle(color: ColorsApp.mainClr, fontSize: 34),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text(
                          "Enter your email and password to continue.",
                          style: Theme.of(context).textTheme.bodySmall,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      _gap(),
                      TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }

                          bool emailValid = RegExp(
                                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                              .hasMatch(value);
                          if (!emailValid) {
                            return 'Please enter a valid email';
                          }

                          return null;
                        },
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
                      ),
                      _gap(),
                      TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }

                          if (value.length < 6) {
                            return 'Password must be at least 6 characters';
                          }
                          return null;
                        },
                        obscureText: !_isPasswordVisible,
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
                          suffixIcon: IconButton(
                            icon: Icon(_isPasswordVisible
                                ? Icons.visibility_off
                                : Icons.visibility),
                            onPressed: () {
                              setState(() {
                                _isPasswordVisible = !_isPasswordVisible;
                              });
                            },
                            color: ColorsApp.mainClr,
                          ),
                          labelStyle: TextStyle(
                            color: ColorsApp.mainClr,
                          ),
                        ),
                      ),
                      _gap(),
                      CheckboxListTile(
                        value: _rememberMe,
                        onChanged: (value) {
                          if (value == null) return;
                          setState(() {
                            _rememberMe = value;
                          });
                        },
                        title: Text(
                          'Remember me',
                          style: TextStyle(
                            color: ColorsApp.mainClr,
                          ),
                        ),
                        controlAffinity: ListTileControlAffinity.leading,
                        dense: true,
                        contentPadding: const EdgeInsets.all(0),
                        activeColor: ColorsApp.mainClr,
                      ),
                      _gap(),
                      MainButton(buttonText: "sign in", onPressed: () {}),
                      _gap(),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const RoleSelectionPage()),
                          );
                        },
                        child: Text.rich(
                          TextSpan(
                            text: 'Don\'t have an account? ',
                            style: TextStyle(
                              fontSize: 14,
                              color: ColorsApp.mainClr,
                            ),
                            children: const [
                              TextSpan(
                                text: 'create a new account',
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

  Widget _gap() => const SizedBox(height: 16);
}
