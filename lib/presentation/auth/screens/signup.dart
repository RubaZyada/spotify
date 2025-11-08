import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotify_app/common/appbar/appbar.dart';
import 'package:spotify_app/common/widgets/button/basic_app_button.dart';
import 'package:spotify_app/core/configs/assets/app_vectors.dart';
import 'package:spotify_app/presentation/auth/widgets/Custom_Text_Field.dart';

class Signup extends StatelessWidget {
   Signup({super.key});
   final TextEditingController fullName = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: BasicAppbar(
        logo: SvgPicture.asset(AppVectors.logo, width: 108,
        ),
  ),
        ),
       body: Padding(
         padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 10),
         child: Column(
          children: [
            _registerText(),
            SizedBox(height: 20,),
            _clickHereText(),
            SizedBox(height: 20,),
            CustomTextField(controller: fullName, hintText: "Full Name"),
            CustomTextField(controller: email, hintText: "Email"),
            CustomTextField(controller: password, hintText: "password", isPassword: true, suffixIcon: Icons.remove_red_eye_outlined,),
            Padding(

              padding: const EdgeInsets.fromLTRB( 40,10,40,0),
              child: BasicAppButton(title:" Creat Account", onPressed: (){}),
            ),
            Spacer(),
            _signinText(),

            
          ],
         ),
       ),
    );
  }
  Widget _registerText(){
    return   const Text("Register",
    style: TextStyle(
      fontSize: 25,
      fontWeight: FontWeight.bold,
    ),
     textAlign: TextAlign.center,
    );
  }
   Widget _clickHereText(){
    return   const Text("If you need any support click here",
    style: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w400,
    ),
     textAlign: TextAlign.center,
    );
  } Widget _signinText(){
    return  Row(
      mainAxisAlignment: MainAxisAlignment.center,
 children:[
  Text("Do you have an account? ",style: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
    ),
     textAlign: TextAlign.center,),
  
  GestureDetector(
    onTap: (){
    
    },
    child: Text("Sign in",style: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: Colors.blue
      ),
       textAlign: TextAlign.center,),
  )
 ]
    );
  }


}

