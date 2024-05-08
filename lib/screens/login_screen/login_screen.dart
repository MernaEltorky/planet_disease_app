import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:planet_disease_app/const.dart';
import 'package:planet_disease_app/custom_widgets/custom_elevated_button.dart';
import 'package:planet_disease_app/custom_widgets/custom_text_field.dart';
import 'package:planet_disease_app/custom_widgets/custom_widgets.dart';
import 'package:planet_disease_app/screens/forget_password_screen/forget_password_screen.dart';
import 'package:planet_disease_app/screens/home_screen/home_screen.dart';
import 'package:planet_disease_app/screens/register_screen/register_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  late TextEditingController emailController;
  late TextEditingController passwordController;
  // **** shape for password
  bool isObscureText = true;
  // step 3 in validation
  GlobalKey<FormState> formKey = GlobalKey<FormState>();


  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formKey,
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // app logo
                  appLogo(imagePath: 'assets/planet.png'),
                  // welcome text
                  welcomeText(text: 'Welcome to Flora Scan'),
                   SizedBox(height: 2.h),
                  // sign in text
                   Text(
                    'Sign in to continue',
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500,
                      color: secondaryColor,

                    ),
                  ),
                  SizedBox(height: 2.h),
                  // email textField
                   CustomTextField(
                    controller: emailController,
                      hint: "Enter your email",
                    icon: const Icon(Icons.email_outlined),
                  ),
                  // password textField
                  CustomTextField(
                    controller: passwordController,
                    obscureText: isObscureText,
                    hint: "Enter your password",
                    icon: const Icon(Icons.lock_open_outlined),
                    // to make password invisible or not
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          isObscureText = !isObscureText;
                        });
                      },
                      icon: isObscureText
                          ? const Icon(Icons.visibility_off)
                          : const Icon(Icons.visibility),
                    ),
                  ),
                  // forget password ?
                  forgotPassword(navToScreen:const ForgetScreen(), context: context),
                  // sign in button
                  CustomElevatedButton(
                      text: 'Sign In',
                    onPressed: () {
                      bool isFormValid = formKey.currentState!.validate();
                      if (isFormValid) {
                        signInWithEmailAndPassword(email: emailController.text, password: passwordController.text)
                        navToScreen(context, navToScreen: const HomeScreen());
                      }
                    },
                  ),
                   SizedBox(
                    height: 3.h,
                  ),

                  // --- OR LINE ----
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.4,
                        height: 1,
                        color: Colors.grey,
                      ),
                      const Text("OR",style: TextStyle(fontWeight: FontWeight.w500,color:primaryColor),),
                      Container(
                        height: 1,
                        width: MediaQuery.of(context).size.width * 0.4,
                        color: Colors.grey,
                      ),
                    ],
                  ),
                   SizedBox(
                    height: 2.h,
                  ),
                  // don't have an account ?
                 accountOption(
                     navToScreen:const RegisterScreen(),
                     context: context,
                     question: 'Don’t have an account ? ' ,
                     option: 'Register',
                 )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
 void signInWithEmailAndPassword({ required String email, required String password}) async{
   try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
         email: email,
         password: password
     );
   } on FirebaseAuthException catch (e) {
     if (e.code == 'user-not-found') {
       print('No user found for that email.');
       showSnackBar(context, message: 'No user found for that email.');
     } else if (e.code == 'wrong-password') {
       print('Wrong password provided for that user.');
       showSnackBar(context, message:' Wrong password provided for that user.');

     }else if(e.code =='INVALID_LOGIN_CREDENTIALS'){
       showSnackBar(context, message: 'Wrong password provided for that user!');
     }
   }
 }
}
