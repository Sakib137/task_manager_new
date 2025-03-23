import 'package:flutter/material.dart';
import 'package:task_manager/UI/screens/email_verification_screen.dart';
import 'package:task_manager/UI/screens/sign_in_screen.dart';
import 'package:task_manager/UI/screens/sign_up_screen.dart';
import 'package:task_manager/UI/screens/splash_screen.dart';
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
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
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

        return MaterialPageRoute(builder: (_) => widget);
      },
    );
  }
}