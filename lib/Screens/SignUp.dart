import 'package:flutter/material.dart';
import 'package:log_auth/widgets/Textfield.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}


class _SignUpScreenState extends State<SignUpScreen> {
final TextEditingController emailController = TextEditingController();
final TextEditingController passwordController = TextEditingController();
final TextEditingController confirmpassController = TextEditingController();


  @override
  Widget build(BuildContext context) {
  double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: SizedBox(
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              height: height/2.7,
              child: Image.asset("images/signUp.png"),
            ),

            //for email input
            InputTextField(
              textEditingController: emailController, 
              hintText: "Enter Your Email", 
              icon: Icons.email
            ),


            //for password input
            InputTextField(
              textEditingController: passwordController, 
              hintText: "Enter Your Password", 
              icon: Icons.lock_outline
           ),


            //for confirm password
            InputTextField(
              textEditingController: confirmpassController, 
              hintText: "Confirm Yout Password", 
              icon: Icons.lock
            ),
            


            
            ],
        ),
      )),
    );
  }
}
