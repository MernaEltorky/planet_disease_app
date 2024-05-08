import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:planet_disease_app/custom_widgets/custom_text_field.dart';
import 'package:planet_disease_app/custom_widgets/custom_widgets.dart';
import 'package:planet_disease_app/screens/home_screen/home_screen.dart';
import 'package:planet_disease_app/screens/login_screen/login_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {

  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController confirmationPasswordController;

  bool isObscureText = true;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    confirmationPasswordController = TextEditingController();
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmationPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: ListView(
        children: [
          Form(
            key: formKey,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // app logo
                  appLogo(imagePath: 'assets/planet.png'),
                  // welcome text
                  welcomeText(text: 'Let’s Get Started'),
                  SizedBox(height: 2.h),
                  // name textField
                  CustomTextField(
                    controller: nameController,
                    hint: "Enter your Name",
                    icon: const Icon(Icons.person),
                  ),
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
                  // confirmation password textField
                  CustomTextField(
                    controller: confirmationPasswordController,
                    obscureText: isObscureText,
                    hint: "Enter your confirmation password",
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
                  SizedBox(
                    width: MediaQuery.of(context).size.width*0.75,
                    height: 57,

                    child: ElevatedButton(

                      onPressed:(){
                        bool isFormValid = formKey.currentState!.validate();

                        if(isFormValid){

                          Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(builder: (context) => HomeScreen()),
                                  (route) => false);
                        }

                      },
                      child: const Text("sign up"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xff40BFFF),
                        shadowColor: const Color(0xff40BFFF).withOpacity(0.24),
                      ),
                    ),
                  ),

                  const SizedBox(height: 20,),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(" have a accound?"),
                      const SizedBox(width: 8,),

                      GestureDetector(
                        onTap: (){
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(builder: (context) => LoginScreen(),

                            ),
                          );
                        },


                        child:const Text("Sign in",
                          style:TextStyle(color:Colors.blue,fontWeight: FontWeight.bold),


                        ) ,

                      ),

                    ],

                  )


                ],
              ),
            ),
          ),
        ],
      ),


    );
  }
  void createUserWithEmailAndPassword({ required String email, required String password}) async{
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }else if(e.code =='INVALID_LOGIN_CREDENTIALS'){
        print('Wrong password provided for that user!');
      }
    } catch (e) {
      print(e);
    }
  }
}
