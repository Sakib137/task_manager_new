import 'package:flutter/material.dart';
import 'package:task_manager/UI/screens/update_profile_screen.dart';
import 'package:task_manager/UI/screens/utils/app_colors.dart';

class TMAppbar extends StatelessWidget implements PreferredSizeWidget {
  const TMAppbar({
    super.key,
    this.fromUpdateProfile = false,
  });

  final bool fromUpdateProfile;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return AppBar(
      iconTheme: IconThemeData(color: Colors.white),
      backgroundColor: AppColors.themeColor,
      title: Row(
        children: [
          CircleAvatar(
    
          ),
          SizedBox(width: 12,),
          Expanded(
            child: GestureDetector(
              onTap: () {
                if(!fromUpdateProfile)
                {
                  Navigator.pushNamed(context, UpdateProfileScreen.name);
                }
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Md Sakib Al Hasan", style: textTheme.titleSmall?.copyWith(color: Colors.white),),
                  Text("mdsakib124202@gmail.com", style: textTheme.bodySmall?.copyWith(color: Colors.white),),
                ],
              ),
            ),
          ),
          IconButton(onPressed: (){}, icon: Icon(Icons.logout_outlined))
        ],
      ),
    );
  }
  @override
  Size get preferredSize => Size.fromHeight(56);
}