import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:task_manager/UI/controllers/auth_controllers.dart';
import 'package:task_manager/UI/screens/email_verification_screen.dart';
import 'package:task_manager/UI/screens/main_bottom_nav_screen.dart';
import 'package:task_manager/UI/screens/sign_up_screen.dart';
import 'package:task_manager/UI/screens/utils/app_colors.dart';
import 'package:task_manager/UI/screens/utils/urls.dart';
import 'package:task_manager/data/models/user_model.dart';
import 'package:task_manager/data/services/network_caller.dart';
import 'package:task_manager/widgets/loading_indicator.dart';
import 'package:task_manager/widgets/screen_background.dart';
import 'package:task_manager/widgets/snack_bar_message.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  static const String name = '/sign_in';

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController _emailTEController = TextEditingController();
  final TextEditingController _passwordTEController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _signInProgress = false;
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: ScreenBackground(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 80),
                  Text("Get Started With", style: textTheme.titleLarge),
                  SizedBox(height: 24),
                  TextFormField(
                    controller: _emailTEController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(hintText: "Email"),
                    validator: (String? value) {
                      if (value?.trim().isEmpty ?? true) {
                        return "Email is required";
                      } else if (!value!.contains("@")) {
                        return "Invalid email";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 8),
                  TextFormField(
                    controller: _passwordTEController,
                    obscureText: true,
                    decoration: InputDecoration(hintText: "Password"),
                    validator: (String? value) {
                      if (value?.trim().isEmpty ?? true) {
                        return "Password is required";
                      } else if (value!.length < 6) {
                        return "Minimum length of password is 6 characters";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 24),
                  Visibility(
                    visible: _signInProgress == false,
                    replacement: LoadingIndicator(),
                    child: ElevatedButton(
                      onPressed: _onTapSignInButton,
                      child: Icon(Icons.arrow_circle_right_outlined),
                    ),
                  ),
                  SizedBox(height: 48),

                  Center(
                    child: Column(
                      children: [
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(
                              context,
                              EmailVerificationScreen.name,
                            );
                          },
                          child: Text("Forgot Password?"),
                        ),

                        _buildSignUpSection(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _onTapSignInButton() {
    if (_formKey.currentState!.validate()) {
      _signIn();
    }
  }

  Future<void> _signIn() async {
    _signInProgress = true;
    setState(() {});

    Map<String, dynamic> requestBody = {
      "email": _emailTEController.text.trim(),
      "password": _passwordTEController.text,
    };

    final NetworkResponse response = await NetworkCaller.postRequest(
      url: Urls.loginUrl,
      body: requestBody,
    );

    if (response.isSuccess) {
      String token = response.responseData!["token"];
      UserModel userModel = UserModel.fromJson(response.responseData!["data"]);
      await AuthControllers.saveUserData(token, userModel);
      Navigator.pushReplacementNamed(context, MainBottomNavScreen.name);
    } else {
      _signInProgress = false;
      setState(() {});
      if (response.statusCode == 401) {
        showSnackBarMessage(context, "Email/Password is Invalid. Try again!");
      } else {
        showSnackBarMessage(context, response.errorMessage);
      }
    }
  }

  Widget _buildSignUpSection() {
    return RichText(
      text: TextSpan(
        text: "Don't have an account? ",
        style: TextStyle(color: Colors.black54, fontWeight: FontWeight.w600),
        children: [
          TextSpan(
            text: "Sign Up",
            style: TextStyle(
              color: AppColors.themeColor,
              fontWeight: FontWeight.bold,
            ),
            recognizer:
                TapGestureRecognizer()
                  ..onTap = () {
                    Navigator.pushNamed(context, SignUpScreen.name);
                  },
          ),
        ],
      ),
    );
  }

  // @override
  //   void dispose() {
  //     _emailTEController.dispose();
  //     _passwordTEController.dispose();
  //     super.dispose();
  //   }
}
