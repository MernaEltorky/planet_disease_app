import 'package:flutter/material.dart';
import 'package:planet_disease_app/const.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CustomElevatedButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const CustomElevatedButton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 60.w,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: Padding(
          padding:  EdgeInsets.symmetric(vertical: 13.sp,horizontal: 25.sp),
          child: Text(
            text,
            style: TextStyle(
                color: Colors.white,
                fontSize: 19.sp
            ),
          ),
        ),

      ),
    );
  }
}