import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:task_manager/UI/screens/utils/app_colors.dart';
import 'package:task_manager/widgets/screen_background.dart';

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
  final TextEditingController _phoneNumberTEController = TextEditingController();
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
                Text("Join With Us", style: textTheme.titleLarge,),
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
                  controller: _firstNameTEController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                   hintText: "First Name",
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                TextFormField(
                  controller: _lastNameTEController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                   hintText: "Last Name",
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                TextFormField(
                  controller: _phoneNumberTEController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                   hintText: "Phone Number",
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
                  
                  onPressed: (){}, child: Icon(Icons.arrow_circle_right_outlined),),
                SizedBox(height: 48,),
            
                Center(
                  child: Column(
                    children: [
                      
                      _buildSignInSection(),
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

  Widget _buildSignInSection (){
    return RichText(text: TextSpan(
      text: "Have an Account? ",
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
    Navigator.pop(context);
          }
        ),
      ]
    ),
    );
}
@override
  void dispose() {
    _emailTEController.dispose();
    _firstNameTEController.dispose();
    _lastNameTEController.dispose();
    _phoneNumberTEController.dispose();
    _passwordTEController.dispose();
    super.dispose();
  }
}


