import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MyTextFormFild extends StatelessWidget {
  MyTextFormFild({
    super.key,
    required this.title,
    required this.controller,
  });
  TextEditingController controller = TextEditingController();
  String title;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: title,
        labelStyle: const TextStyle(color: Colors.blue),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            width: 2,
            color: Colors.blue,
          ),
          borderRadius: BorderRadius.circular(25),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(width: 2, color: Colors.blue),
          borderRadius: BorderRadius.circular(25),
        ),
      ),
      cursorRadius: const Radius.circular(30),
      controller: controller,
    );
  }
}
