import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:task_manager/UI/screens/utils/app_colors.dart';
import 'package:task_manager/widgets/screen_background.dart';
import 'package:task_manager/widgets/tm_app_bar.dart';

class UpdateProfileScreen extends StatefulWidget {
  const UpdateProfileScreen({super.key});

  static const String name = '/update_profile';

  @override
  State<UpdateProfileScreen> createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen> {
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
      appBar: TMAppbar(
        fromUpdateProfile: true,
      ),
      body: ScreenBackground(child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 40,),
                Text("Update Profile", style: textTheme.titleLarge,),
                SizedBox(
                  height: 24,
                ),
                _buildPhotoPicker(),
                SizedBox(
                  height: 8,
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

  Widget _buildPhotoPicker() {
        final textTheme = Theme.of(context).textTheme;
    return Container(
                height: 48,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      height: 48,
                      padding: EdgeInsets.symmetric(horizontal: 24),
                      decoration: BoxDecoration(
                        
                        color: Colors.grey,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(8),
                          topLeft: Radius.circular(8),
                        ),
                      ),
                      child: Text("Photo", style: textTheme.bodySmall,),
                    ),
                    SizedBox(width: 12,),
                    Text("No Item Selected", style: textTheme.bodySmall,)
                  ],
                ),
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


