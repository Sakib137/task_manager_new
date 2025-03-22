import 'package:flutter/material.dart';
import 'package:task_manager/UI/screens/sign_in_screen.dart';
import 'package:task_manager/UI/screens/splash_screen.dart';

class TaskManager extends StatelessWidget {
  const TaskManager({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/",
      onGenerateRoute: (RouteSettings settings){
        late Widget widget;
        if (settings.name == SplashScreen.name){
          widget = SplashScreen();
        }
        else if(settings.name == SignInScreen.name){
          widget = SignInScreen();
        }

        return MaterialPageRoute(builder: (_) => widget);
      },
    );
  }
}