import 'package:flutter/material.dart';
import 'package:log_auth/Screens/loginPage.dart';
import 'package:log_auth/Services/auth.dart';
import 'package:log_auth/widgets/button.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Congrats\nYou SuccessFully login..",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
            MyButton(
              onTap: () async {
                AuthService().signOut();

                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => LoginScreen()));
              },
              text: "LogOut",
            ),
          ],
        ),
      ),
    );
  }
}
