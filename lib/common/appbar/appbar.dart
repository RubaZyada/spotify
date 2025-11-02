import 'package:flutter/material.dart';
import 'package:spotify_app/common/helpers/is_dark_mood.dart';

class BasicAppbar extends StatelessWidget {
  const BasicAppbar({super.key});

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
      color: context.isDarkMood ? Colors.black12: Colors.white12,
      borderRadius: BorderRadius.circular(8),
     // shape: BoxShape.circle,
    ),
    child: Icon(Icons.arrow_back, color: context.isDarkMood ? Colors.white : Colors.black),),
    ));
  }
}