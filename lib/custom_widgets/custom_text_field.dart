import 'package:flutter/material.dart';
import 'package:planet_disease_app/const.dart';

typedef Validation = String? Function(String?)?;

class CustomTextField extends StatelessWidget {

  final String hint;
  final Widget? icon;
  final bool obscureText;
  final Widget? suffixIcon;
  final TextEditingController? controller;
  final Validation validation; // Callback

  const CustomTextField({
    super.key,
    required this.hint,
    required this.icon,
    this.obscureText = false, // default value
    this.suffixIcon,
    this.controller,
    this.validation,

  });

  @override
  Widget build(BuildContext context) {

    return Container(
      margin: const EdgeInsets.all(3),
      // margin: EdgeInsets.only(left: 16, right: 16, top: 10, bottom: 10),
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        // to validation
        validator: (text){
          if(text!.isEmpty){
            return 'This Field is required';
          }
          return null;
        },

        decoration: InputDecoration(
          contentPadding:const EdgeInsets.all(20),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: primaryColor),
            borderRadius: BorderRadius.circular(8),),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: primaryColor),
            borderRadius: BorderRadius.circular(8),),
          hintText: hint,
          hintStyle:const TextStyle(color: primaryColor),
          prefixIcon: icon,
          suffixIcon: suffixIcon,
          suffixIconColor: primaryColor,
          prefixIconColor: primaryColor
        ),
      ),
    );
  }
}