import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:task_manager/UI/screens/utils/app_colors.dart';
import 'package:task_manager/UI/screens/utils/urls.dart';
import 'package:task_manager/data/services/network_caller.dart';
import 'package:task_manager/widgets/loading_indicator.dart';
import 'package:task_manager/widgets/screen_background.dart';
import 'package:task_manager/widgets/snack_bar_message.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  static const String name = '/sign_up';

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _emailTEController = TextEditingController();
  final TextEditingController _passwordTEController = TextEditingController();
  final TextEditingController _firstNameTEController = TextEditingController();
  final TextEditingController _lastNameTEController = TextEditingController();
  final TextEditingController _phoneNumberTEController =
      TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _signUpInProgress = false;

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
                  Text("Join With Us", style: textTheme.titleLarge),
                  SizedBox(height: 24),
                  TextFormField(
                    controller: _emailTEController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(hintText: "Email"),
                    validator: (String? value) {
                      if (value?.trim().isEmpty ?? true) {
                        return "Email is required";
                      } else if (!value!.contains("@")) {
                        return "Invalid email address";
                      } else {
                        return null;
                      }
                    },
                  ),
                  SizedBox(height: 8),
                  TextFormField(
                    controller: _firstNameTEController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(hintText: "First Name"),
                    validator: (String? value) {
                      if (value?.trim().isEmpty ?? true) {
                        return "First Name is required";
                      } else {
                        return null;
                      }
                    },
                  ),
                  SizedBox(height: 8),
                  TextFormField(
                    controller: _lastNameTEController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(hintText: "Last Name"),
                    validator: (String? value) {
                      if (value?.trim().isEmpty ?? true) {
                        return "Last Name is required";
                      } else {
                        return null;
                      }
                    },
                  ),
                  SizedBox(height: 8),
                  TextFormField(
                    controller: _phoneNumberTEController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(hintText: "Phone Number"),
                    validator: (String? value) {
                      if (value?.trim().isEmpty ?? true) {
                        return "Phone Number is required";
                      } else {
                        return null;
                      }
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
                        return "Password must be at least 6 characters";
                      } else {
                        return null;
                      }
                    },
                  ),
                  SizedBox(height: 24),
                  Visibility(
                    visible:
                        _signUpInProgress ==
                        false, // will show the elevated button
                    replacement: LoadingIndicator(),
                    child: ElevatedButton(
                      onPressed: _onTapSignUpButton,
                      child: Icon(Icons.arrow_circle_right_outlined),
                    ),
                  ),
                  SizedBox(height: 48),

                  Center(child: Column(children: [_buildSignInSection()])),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _onTapSignUpButton() {
    if (_formKey.currentState!.validate()) {
      _regiterUser();
    }
  }

  Future<void> _regiterUser() async {
    _signUpInProgress = true;
    setState(() {});

    Map<String, dynamic> requestBody = {
      "email": _emailTEController.text.trim(),
      "firstName": _firstNameTEController.text.trim(),
      "lastName": _lastNameTEController.text.trim(),
      "mobile": _phoneNumberTEController.text.trim(),
      "password": _passwordTEController.text,
      "photo": "",
    };

    final NetworkResponse response = await NetworkCaller.postRequest(
      url: Urls.registrationUrl,
      body: requestBody,
    );
    _signUpInProgress = false;
    setState(() {});

    if (response.isSuccess) {
      _clearTextFields();
      showSnackBarMessage(context, "Registration Successfull!");
    } else {
      showSnackBarMessage(context, response.errorMessage);
    }
  }

  void _clearTextFields() {
    _emailTEController.clear();
    _firstNameTEController.clear();
    _lastNameTEController.clear();
    _phoneNumberTEController.clear();
    _passwordTEController.clear();
  }

  Widget _buildSignInSection() {
    return RichText(
      text: TextSpan(
        text: "Have an Account? ",
        style: TextStyle(color: Colors.black54, fontWeight: FontWeight.w600),
        children: [
          TextSpan(
            text: "Sign In",
            style: TextStyle(
              color: AppColors.themeColor,
              fontWeight: FontWeight.bold,
            ),
            recognizer:
                TapGestureRecognizer()
                  ..onTap = () {
                    Navigator.pop(context);
                  },
          ),
        ],
      ),
    );
  }

  // @override
  //   void dispose() {
  //     _emailTEController.dispose();
  //     _firstNameTEController.dispose();
  //     _lastNameTEController.dispose();
  //     _phoneNumberTEController.dispose();
  //     _passwordTEController.dispose();
  //     super.dispose();
  //   }
}
