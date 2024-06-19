import 'package:flutter/material.dart';
import 'package:log_auth/Screens/SignUp.dart';
import 'package:log_auth/Screens/hamePage.dart';
import 'package:log_auth/Services/auth.dart';
import 'package:log_auth/widgets/Textfield.dart';
import 'package:log_auth/widgets/button.dart';
import 'package:log_auth/widgets/snack_bar.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isLoading = true;

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  //email and password auth part
  void loginUser() async {
    setState(() {
      isLoading = true;
    });

    String res = await AuthService().loginUser(
        email: emailController.text, password: passwordController.text);

    if (res == "success") {
      setState(() {
        isLoading = true;
      });

      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) => HomePage()));
    } else {
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
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: double.infinity,
                  height: height / 2.7,
                  child: Image.asset("images/loginImage.png"),
                ),

                //for email input
                InputTextField(
                    textEditingController: emailController,
                    hintText: "Enter Your Email",
                    icon: Icons.email),

                // for password
                InputTextField(
                    isPass: true,
                    textEditingController: passwordController,
                    hintText: "Enter Your Password",
                    icon: Icons.lock),

                //forget your password
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 35),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      "Forget Password?",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Color.fromARGB(255, 45, 152, 240),
                      ),
                    ),
                  ),
                ),

                //login Button
                MyButton(
                  onTap:loginUser,
                  text: "Log In",
                ),

                SizedBox(height: height / 15),

                //not have an account sign up
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Don't Have an Account?",
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    GestureDetector(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SignUpScreen())),
                      child: const Text(
                        " SignUp",
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
        ));
  }
}
