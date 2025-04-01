import 'package:flutter/material.dart';
import 'package:task_manager/UI/controllers/auth_controllers.dart';
import 'package:task_manager/UI/screens/main_bottom_nav_screen.dart';
import 'package:task_manager/UI/screens/sign_in_screen.dart';
import 'package:task_manager/widgets/app_logo.dart';
import 'package:task_manager/widgets/screen_background.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  static const String name = '/';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    moveToNextScreen();
  }

  Future<void> moveToNextScreen() async {
    await Future.delayed(Duration(seconds: 2));
    bool isUserLoggedIn = await AuthControllers.isUserLoggedIn();
    if (isUserLoggedIn) {
      Navigator.pushReplacementNamed(context, MainBottomNavScreen.name);
    } else {
      Navigator.pushReplacementNamed(context, SignInScreen.name);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: ScreenBackground(child: Center(child: AppLogo())));
  }
}
