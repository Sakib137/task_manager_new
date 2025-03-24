import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:task_manager/UI/screens/sign_in_screen.dart';

import 'package:task_manager/UI/screens/utils/app_colors.dart';
import 'package:task_manager/widgets/screen_background.dart';

class resetPasswordScreen extends StatefulWidget {
  const resetPasswordScreen({super.key});

  static const String name = '/reset_password';

  @override
  State<resetPasswordScreen> createState() => _resetPasswordScreenState();
}

class _resetPasswordScreenState extends State<resetPasswordScreen> {
  final TextEditingController _emailTEController = TextEditingController();
  final TextEditingController _passwordTEController = TextEditingController();  
  final TextEditingController _confirmPasswordTEController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {

    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: ScreenBackground(child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 80,),
                Text("Set Password", style: textTheme.titleLarge,),
                SizedBox(
                  height: 8,
                ),
                Text("Minimum length of password 8 character with letter and number combination", style: textTheme.titleMedium,),
                SizedBox(
                  height: 24,
                ),
                TextFormField(
                  controller: _passwordTEController,
                  obscureText: true,
                  decoration: InputDecoration(
                   hintText: "Password",
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                TextFormField(
                  controller: _confirmPasswordTEController,
                  obscureText: true,
                  decoration: InputDecoration(
                   hintText: "Confirm Password",
                  ),
                ),
                SizedBox(height: 24,),
                ElevatedButton(
                  
                  onPressed: (){}, child: Icon(Icons.arrow_circle_right_outlined),),
                SizedBox(height: 48,),
            
                Center(
                  child: Column(
                    children: [
                      _buildSignUpSection(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      )
      )
    );
  }

  Widget _buildSignUpSection (){
    return RichText(text: TextSpan(
      text: "Have an account? ",
      style: TextStyle(
        color: Colors.black54,
        fontWeight: FontWeight.w600,
      ),
      children: [
        TextSpan(
          text: "Sign In",
          style: TextStyle(
            color: AppColors.themeColor,
            fontWeight: FontWeight.bold,
          ),
          recognizer: TapGestureRecognizer()..onTap = (){
    Navigator.pushNamedAndRemoveUntil(context, SignInScreen.name, (value) => false);
          }
        ),
      ]
    ),
    );
}
@override
  void dispose() {
    _passwordTEController.dispose();
    _confirmPasswordTEController.dispose();
    super.dispose();
  }
}


