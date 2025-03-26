import 'package:flutter/material.dart';
import 'package:task_manager/UI/screens/add_new_task_screen.dart';
import 'package:task_manager/UI/screens/cancelled_task_list_screen.dart';
import 'package:task_manager/UI/screens/completed_task_list_screen.dart';
import 'package:task_manager/UI/screens/email_verification_screen.dart';
import 'package:task_manager/UI/screens/main_bottom_nav_screen.dart';
import 'package:task_manager/UI/screens/new_task_list_screen.dart';
import 'package:task_manager/UI/screens/otp_verification_screen.dart';
import 'package:task_manager/UI/screens/progress_task_list_screen.dart';
import 'package:task_manager/UI/screens/reset_password_screen.dart';
import 'package:task_manager/UI/screens/sign_in_screen.dart';
import 'package:task_manager/UI/screens/sign_up_screen.dart';
import 'package:task_manager/UI/screens/splash_screen.dart';
import 'package:task_manager/UI/screens/update_profile_screen.dart';
import 'package:task_manager/UI/screens/utils/app_colors.dart';

class TaskManager extends StatelessWidget {
  const TaskManager({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/",

    theme: ThemeData(
      textTheme: TextTheme(
        titleLarge: TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.bold,
        ),
        titleMedium: TextStyle(
          color: Colors.grey,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
      
      inputDecorationTheme: InputDecorationTheme(
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: EdgeInsets.symmetric(horizontal: 16),
                  hintStyle: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w400
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
      ),

      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.themeColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  fixedSize: Size.fromWidth(double.maxFinite),
                  padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                  foregroundColor: Colors.white,
                  textStyle: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  )
                ),
      ),
    
    
    ),


      onGenerateRoute: (RouteSettings settings){
        late Widget widget;
        if (settings.name == SplashScreen.name){
          widget = SplashScreen();
        }
        else if(settings.name == SignInScreen.name){
          widget = SignInScreen();
        }
        else if(settings.name == SignUpScreen.name){
          widget = SignUpScreen();
        }
        else if(settings.name == emailVerificationScreen.name){
          widget = emailVerificationScreen();
        }
        else if(settings.name == otpVerificationScreen.name){
          widget = otpVerificationScreen();
        }
        else if(settings.name == resetPasswordScreen.name){
          widget = resetPasswordScreen();
        }
        else if(settings.name == MainBottomNavScreen.name){
          widget = MainBottomNavScreen();
        }
         else if(settings.name == NewTaskListScreen.name){
          widget = NewTaskListScreen();
        }
         else if(settings.name == ProgressTaskListScreen.name){
          widget = ProgressTaskListScreen();
        }
         else if(settings.name == CompletedTaskListScreen.name){
          widget = CompletedTaskListScreen();
        }
         else if(settings.name == CancelledTaskListScreen.name){
          widget = CancelledTaskListScreen();
        }
         else if(settings.name == AddNewTaskScreen.name){
          widget = AddNewTaskScreen();
        }
        else if(settings.name == UpdateProfileScreen.name){
          widget = UpdateProfileScreen();
        }

        return MaterialPageRoute(builder: (_) => widget);
      },
    );
  }
}