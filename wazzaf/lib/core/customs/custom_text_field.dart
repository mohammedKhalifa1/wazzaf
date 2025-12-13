import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hint;
  final TextEditingController? controller;
  const CustomTextField({super.key, required this.hint, this.controller});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,

      child: TextFormField(
        style: TextStyle(fontSize: 12),
        textDirection: TextDirection.rtl,
        decoration: InputDecoration(
          counterStyle: TextStyle(fontSize: 3),
          hintText: hint,
          isDense: true,
          hintStyle: TextStyle(fontSize: 12),
          hintTextDirection: TextDirection.rtl,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        ),
      ),
    );
  }
}
