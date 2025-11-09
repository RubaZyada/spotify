import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotify_app/common/appbar/appbar.dart';
import 'package:spotify_app/common/widgets/button/basic_app_button.dart';
import 'package:spotify_app/core/configs/assets/app_vectors.dart';
import 'package:spotify_app/presentation/auth/screens/signup.dart';
import 'package:spotify_app/presentation/auth/widgets/Custom_Text_Field.dart';

class Signin extends StatelessWidget {
  Signin({super.key});
  final TextEditingController UserName = TextEditingController();
  final TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _registerText(context),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: BasicAppbar(logo: SvgPicture.asset(AppVectors.logo, width: 108)),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 10),
        child: Column(
          children: [
            _signInText(),
            SizedBox(height: 20),
            _clickHereText(),
            SizedBox(height: 20),
            CustomTextField(
              controller: UserName,
              hintText: "Enter UserName Or Email",
            ),
            CustomTextField(
              controller: password,
              hintText: "password",
              isPassword: true,
              suffixIcon: Icons.remove_red_eye_outlined,
            ),
           
            Padding(
              padding: const EdgeInsets.fromLTRB(40, 10, 40, 0),
              child: BasicAppButton(title: " Sign In", onPressed: () {}),
            ),

            // Spacer(),
          ],
        ),
      ),
    );
  
  }
  }
Widget _signInText() {
  return const Text(
    "Sign In",
    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
    textAlign: TextAlign.center,
  );
}

Widget _clickHereText() {
  return const Text(
    "If you need any support click here",
    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
    textAlign: TextAlign.center,
  );
}

Widget _registerText(BuildContext context ) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 10),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Not a Member? ",
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
          textAlign: TextAlign.center,
        ),

        TextButton(
          child:  Text( "Register Now",
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: Colors.blue,
          ),
          textAlign: TextAlign.center,) ,
          onPressed: (){
                 Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => Signup(),
                      ),
                    );
          },
        ),
      ],
    ),
  );
}
  