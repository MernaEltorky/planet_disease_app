import 'package:flutter/material.dart';
import 'package:planet_disease_app/custom_widgets/custom_text_field.dart';
import 'package:planet_disease_app/custom_widgets/custom_widgets.dart';


class ForgetScreen extends StatelessWidget {
  const ForgetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
          
              appLogo(imagePath: 'assets/planet.png')
          
              , Text(
                'pleace enter your emile to resent password ',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff809f80),
                ),
              ),
          
              const SizedBox(height: 8),
          
              const CustomTextField(
                  hint: "Enter your email", icon: Icon(Icons.email_outlined)),
          
          
            ],
          ),
        ],
      ),
    );
  }


}