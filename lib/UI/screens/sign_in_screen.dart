import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:task_manager/UI/screens/email_verification_screen.dart';
import 'package:task_manager/UI/screens/main_bottom_nav_screen.dart';
import 'package:task_manager/UI/screens/sign_up_screen.dart';
import 'package:task_manager/UI/screens/utils/app_colors.dart';
import 'package:task_manager/widgets/screen_background.dart';

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
                Text("Get Started With", style: textTheme.titleLarge,),
                SizedBox(
                  height: 24,
                ),
                TextFormField(
                  controller: _emailTEController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                   hintText: "Email",
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                TextFormField(
                  controller: _passwordTEController,
                  obscureText: true,
                  decoration: InputDecoration(
                   hintText: "Password",
                  ),
                ),
                SizedBox(height: 24,),
                ElevatedButton(
                  
                  onPressed: (){
                    Navigator.pushReplacementNamed(context, MainBottomNavScreen.name);
                  }, child: Icon(Icons.arrow_circle_right_outlined),),
                SizedBox(height: 48,),
            
                Center(
                  child: Column(
                    children: [
                      TextButton(onPressed: (){
                        Navigator.pushNamed(context, emailVerificationScreen.name);
                      }, child: Text("Forgot Password?",),),
                      
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
      text: "Don't have an account? ",
      style: TextStyle(
        color: Colors.black54,
        fontWeight: FontWeight.w600,
      ),
      children: [
        TextSpan(
          text: "Sign Up",
          style: TextStyle(
            color: AppColors.themeColor,
            fontWeight: FontWeight.bold,
          ),
          recognizer: TapGestureRecognizer()..onTap = (){
    Navigator.pushNamed(context, SignUpScreen.name);
          }
        ),
      ]
    ),
    );
}
@override
  void dispose() {
    _emailTEController.dispose();
    _passwordTEController.dispose();
    super.dispose();
  }
}


