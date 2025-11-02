//import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify_app/common/widgets/button/basic_app_button.dart';
import 'package:spotify_app/core/configs/assets/app_images.dart';
import 'package:spotify_app/core/configs/assets/app_vectors.dart';
import 'package:spotify_app/core/configs/theme/app_colors.dart';
import 'package:spotify_app/presentation/auth/screens/signup_or_signin.dart';
import 'package:spotify_app/presentation/choose_mode/bloc/theme_cubit.dart';

class ChooseModeScreen extends StatelessWidget {
  const ChooseModeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ThemeCubit, ThemeMode>(
        builder: (context, currentMode) {
          return Stack(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 40),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(AppImages.chooseModeBG),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child: SvgPicture.asset(AppVectors.logo),
                    ),
                    const Spacer(),
                    const Text(
                      'Choose mode',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(height: 14),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // 🌙 DARK MODE BUTTON
                        GestureDetector(
                          onTap: () {
                            context.read<ThemeCubit>().updatetheme(ThemeMode.dark);
                          },
                          child: Column(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(8),
                                width: 70,
                                height: 70,
                                decoration: BoxDecoration(
                                  color: AppColors.greyBackground.withOpacity(.5),
                                  borderRadius: BorderRadius.circular(70),
                                  border: Border.all(
                                    width: 3,
                                    color: currentMode == ThemeMode.dark
                                        ? Colors.white// ✅ active color
                                        : Colors.transparent, // inactive
                                  ),
                                ),
                                child: SvgPicture.asset(AppVectors.darkMode),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                'Dark Mode',
                                style: TextStyle(
                                  color: 
                                       Colors.white,
                                  fontWeight: currentMode == ThemeMode.dark
                                      ? FontWeight.bold
                                      : FontWeight.normal,
                                ),
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(width: 15),

                        // LIGHT MODE BUTTON
                        GestureDetector(
                          onTap: () {
                            context.read<ThemeCubit>().updatetheme(ThemeMode.light);
                          },
                          child: Column(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(8),
                                width: 70,
                                height: 70,
                                decoration: BoxDecoration(
                                  color: AppColors.greyBackground.withOpacity(.5),
                                  borderRadius: BorderRadius.circular(70),
                                  border: Border.all(
                                    width: 3,
                                    color: currentMode == ThemeMode.light
                                        ?  Colors.white // ✅ active color
                                        : Colors.transparent,
                                  ),
                                ),
                                child: SvgPicture.asset(AppVectors.lightMode),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                'Light Mode',
                                style: TextStyle(
                                  color: 
                                       Colors.white,
                                  fontWeight: currentMode == ThemeMode.light
                                      ? FontWeight.bold
                                      : FontWeight.normal,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 50),
                    BasicAppButton(title: 'Continue', onPressed: () {
                      Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => SignupOrSignin(),
                      ),
                    );
                    }),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

// import 'dart:ui';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:spotify_app/common/widgets/button/basic_app_button.dart';
// import 'package:spotify_app/core/configs/assets/app_images.dart';
// import 'package:spotify_app/core/configs/assets/app_vectors.dart';
// import 'package:spotify_app/core/configs/theme/app_colors.dart';
// import 'package:spotify_app/presentation/choose_mode/bloc/theme_cubit.dart';

// class ChooseModeScreen extends StatelessWidget {
//   const ChooseModeScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           Container(
//             padding: EdgeInsets.symmetric(horizontal: 40, vertical: 40),
//             decoration: BoxDecoration(
//               image: DecorationImage(
//                 image: AssetImage(AppImages.chooseModeBG),
//                 fit: BoxFit.cover,
//               ),
//             ),
//             child: Column(
//               children: [
//                 Align(
//                   alignment: Alignment.topCenter,
//                   child: SvgPicture.asset(AppVectors.logo),
//                 ),
//                 Spacer(),
//                 Text(
//                   'Choose mode',
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 20,
//                     fontWeight: FontWeight.w400,
//                   ),
//                 ),
//                 SizedBox(height: 14),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     GestureDetector(
//                       onTap:(){
//                     context.read<ThemeCubit>().updatetheme(ThemeMode.dark);
//                   } ,
//                       child: Column(
//                         children: [
//                           Container(
//                             padding: EdgeInsets.all(8),
//                             width: 70,
//                             height: 70,
//                             decoration: BoxDecoration(
//                               color: AppColors.greyBackground.withOpacity(.5),
//                               borderRadius: BorderRadius.circular(70),
//                             ),
//                             child: SvgPicture.asset(AppVectors.darkMode),
//                           ),
                                      
//                           SizedBox(height: 8),
//                           Text(
//                             'Dark Mode',
//                             style: TextStyle(color: Colors.white),
//                           ),
//                         ],
//                       ),
//                     ),
//                     SizedBox(width: 15 ),
//                     GestureDetector(
//                       onTap:(){
//                     context.read<ThemeCubit>().updatetheme(ThemeMode.light);
//                   } ,
//                       child: Column(
//                         children: [
//                           Container(
//                             padding: EdgeInsets.all(8),
//                             width: 70,
//                             height: 70,
//                             decoration: BoxDecoration(
//                               color: AppColors.greyBackground.withOpacity(.5),
//                               borderRadius: BorderRadius.circular(70),
//                             ),
//                             child: SvgPicture.asset(AppVectors.lightMode),
//                           ),
                                      
//                           SizedBox(height: 8),
//                           Text(
//                             'Light Mode',
//                             style: TextStyle(color: Colors.white),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//                 SizedBox(height: 50),
//                 BasicAppButton(title: 'Continue', onPressed: () {}),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
