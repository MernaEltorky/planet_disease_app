import 'package:flutter/material.dart';
import 'package:planet_disease_app/const.dart';
import 'package:responsive_sizer/responsive_sizer.dart';


Widget appLogo({required String imagePath}) {
  return Image.asset(
    imagePath,
    height: 35.h,
    width: double.infinity,
  );
}

Widget welcomeText({required String text}) {
  return Text(
    text,
    style: TextStyle(
        fontSize: 20.sp, fontWeight: FontWeight.w500, color: primaryColor),
  );
}


Widget forgotPassword({required Widget navToScreen,required BuildContext context}) {
  return GestureDetector(
    onTap: (){
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (
                BuildContext context) => navToScreen
        ),
      );
    },
    child: Container(
      padding:const EdgeInsets.all(10),
      alignment:Alignment.centerRight,
      child: Text(
        'Forgot Password ?',
        style: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.w400,
          color: secondaryColor,

        ),
      ),
    ),
  );
}

Widget accountOption({required Widget navToScreen,required BuildContext context,required String question,required String option}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        question,
        style: TextStyle(
          fontSize: 17.sp,
          fontWeight: FontWeight.w800,
          color: primaryColor,

        ),
      ),
      GestureDetector(
        onTap: (){
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
                builder: (
                    BuildContext context) => navToScreen
            ),
                (route) => false,
          );
        },
        child: Text(
          option,
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
            color: secondaryColor,

          ),
        ),
      ),
    ],
  );
}

navToScreen(context,{required Widget navToScreen}){
  Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(
          builder: (context) =>  navToScreen),
          (route) => false);
}