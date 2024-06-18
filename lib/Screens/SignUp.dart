import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:log_auth/Screens/hamePage.dart';
import 'package:log_auth/Screens/loginPage.dart';
import 'package:log_auth/Services/auth.dart';
import 'package:log_auth/widgets/Textfield.dart';
import 'package:log_auth/widgets/button.dart';
import 'package:log_auth/widgets/snack_bar.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  bool isLoading = false;

  void signUpUser() async {
    String res = await AuthService().signUpuser(
        email: emailController.text,
        password: passwordController.text,
        name: nameController.text);

    // if signUp is Success then user can be navigate to the different page
    if (res == "successfully") {
      setState(() {
        isLoading = true;
      });

      //navigate to next screen
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => HomePage(),
      ));
    }
    // other wise show the error message
    else {
      setState(() {
        isLoading = false;
      });
      showSnackBar(context, res);
    }
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
            child: SizedBox(
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                height: height / 2.7,
                child: Image.asset("images/signUp.png"),
              ),

              //for name
              InputTextField(
                  textEditingController: nameController,
                  hintText: "Enter Your Name",
                  icon: Icons.person),

              //for email
              InputTextField(
                  textEditingController: emailController,
                  hintText: "Enter Your Email",
                  icon: Icons.email),

              //for  password
              InputTextField(
                  textEditingController: passwordController,
                  hintText: "Enter Your Password",
                  icon: Icons.lock),

              MyButton(
                onTap: () => signUpUser,
                text: "Sign Up",
              ),

              SizedBox(height: height / 15),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Already have an Account?",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  GestureDetector(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginScreen(),
                      ),
                    ),
                    child: const Text(
                      " LogIn",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        )),
      ),
    );
  }
}
