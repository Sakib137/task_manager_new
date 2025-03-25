import 'package:flutter/material.dart';
import 'package:task_manager/UI/screens/utils/app_colors.dart';

class TMAppbar extends StatelessWidget implements PreferredSizeWidget {
  const TMAppbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return AppBar(
      backgroundColor: AppColors.themeColor,
      title: Row(
        children: [
          CircleAvatar(
    
          ),
          SizedBox(width: 12,),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Md Sakib Al Hasan", style: textTheme.titleSmall?.copyWith(color: Colors.white),),
                Text("mdsakib124202@gmail.com", style: textTheme.bodySmall?.copyWith(color: Colors.white),),
              ],
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