import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class TextPasswordField extends StatefulWidget {
  final String title;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final Icon? suffix;
  final String? Function(String?)? validator;
  final String? prefixImagePath; // New parameter for asset image path

  const TextPasswordField({
    super.key,
    required this.title,
    required this.controller,
    this.keyboardType = TextInputType.text,
    this.suffix,
    this.validator,
    this.prefixImagePath, // Initialize it here
  });

  @override
  State<TextPasswordField> createState() => _TextPasswordFieldState();
}

class _TextPasswordFieldState extends State<TextPasswordField> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: Color(0xff3B6985),
      obscureText: obscureText,
      keyboardType: widget.keyboardType,
      controller: widget.controller,
      validator: widget.validator,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white, // Background color
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.r), // Rounded corners
          borderSide: const BorderSide(
            color: Color(0xffC8C8C8), // Grey border color
            width: 2.0,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.r),
          borderSide: const BorderSide(
            color: Color(0xffC8C8C8), // Change to blue when focused
            width: 2,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.r),
          borderSide: const BorderSide(
            color: Color(0xffC8C8C8), // Change to blue when focused
            width: 2,
          ),
        ),
        prefixIcon: widget.prefixImagePath != null
            ? Padding(
          padding: EdgeInsets.all(12.0.sp),
          child: Image.asset(widget.prefixImagePath!,scale: 4,), // Asset image as prefix
        )
            : null,
        suffixIcon: GestureDetector(
          child: obscureText
              ? const Icon(Icons.visibility_off_outlined, color: Colors.black)
              : const Icon(Icons.visibility, color: Colors.black),
          onTap: () {
            setState(() {
              obscureText = !obscureText;
            });
          },
        ),
        contentPadding: EdgeInsets.all(16.sp), // Padding inside the TextField
        hintText: widget.title, // Hint text
        floatingLabelBehavior: FloatingLabelBehavior.never,
      ),
    );
  }
}