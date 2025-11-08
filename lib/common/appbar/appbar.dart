import 'package:flutter/material.dart';
import 'package:spotify_app/common/helpers/is_dark_mood.dart';

class BasicAppbar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? logo; // 👈 نستقبل أي ويدجت (مثل AppVectors.logo)
  const BasicAppbar({super.key, this.logo});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: IconButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        icon: Container(
          decoration: BoxDecoration(
            color: context.isDarkMood ? Colors.black12 : Colors.white12,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(
            Icons.arrow_back,
            color: context.isDarkMood ? Colors.white : Colors.black,
          ),
        ),
      ),
      centerTitle: true,
      title: logo, // 
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
