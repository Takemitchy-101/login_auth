import 'package:flutter/material.dart';

class InputTextField extends StatelessWidget {
  final TextEditingController textEditingController;
  final bool isPass;
  final String hintText;
  final IconData icon;

  const InputTextField({
    super.key,
    required this.textEditingController,
     this.isPass = false,
    required this.hintText,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextField(
        controller: textEditingController,
        obscureText: isPass,
        decoration: InputDecoration(
            hintText: hintText,
            hintStyle: const TextStyle(
              fontSize: 20,
              color: Colors.black45,
            ),
            prefixIcon:Icon(
              icon,
              color: Colors.black45,
            ),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
            border: InputBorder.none,
            filled: true,
            fillColor: const Color.fromARGB(137, 207, 200, 200),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(30),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                width: 2,
                color: Colors.blue.shade400,
              ),
              borderRadius: BorderRadius.circular(30),
            )),
      ),
    );
  }
}
