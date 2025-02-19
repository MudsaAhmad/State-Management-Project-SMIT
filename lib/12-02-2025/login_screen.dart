// import 'package:flutter/gestures.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'dart:io';
//
// import '../componants/button.dart';
// import '../componants/email_text_field.dart';
// import '../componants/password_text_field.dart';
//
// class LoginScreen extends StatelessWidget {
//   LoginScreen({super.key});
//
//   // Controllers for email and password fields
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();
//
//   // Form key to manage form validation
//   final _formKey = GlobalKey<FormState>();
//
//   @override
//   Widget build(BuildContext context) {
//     var screenHeight = MediaQuery.of(context).size.height;
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: EdgeInsets.only(left: 23.w, right: 22.w),
//           child:
//                  Column(
//                   children: [
//                     // Content that takes up available space
//                     Form(
//                       key: _formKey,
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           SizedBox(
//                             height: screenHeight * 0.1,
//                           ),
//                           Image.asset(
//                             'assets/Layer 2.png',
//                             height: 120.h,
//                             width: 150.w,
//                           ),
//                           SizedBox(height: 20.h),
//                           Text(
//                             "Login to your account",
//
//                           ),
//                           SizedBox(height: 27.h),
//                           // Email field with validation
//                           TextEmailField(
//                             prefixImagePath: 'assets/Layer 2.png',
//                             keyboardType: TextInputType.emailAddress,
//                             title: 'Enter your email ',
//                             controller: emailController,
//                             validator: (value) {
//                               if (value == null || value.isEmpty) {
//                                 return 'Please enter your email';
//                               }
//                               if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
//                                 return 'Please enter a valid email address';
//                               }
//                               return null;
//                             },
//                           ),
//                           SizedBox(height: 16.h),
//                           // Password field with validation
//                           TextPasswordField(
//                             title: 'Enter your password ',
//                             controller: passwordController,
//                             suffix: const Icon(Icons.visibility_off_outlined),
//                             prefixImagePath: 'assets/Layer 2.png',
//                             validator: (value) {
//                               if (value == null || value.isEmpty) {
//                                 return 'Please enter your password';
//                               }
//                               if (value.length < 6) {
//                                 return 'Password must be at least 6 characters long';
//                               }
//                               return null;
//                             },
//                           ),
//                           SizedBox(height: 16.h),
//                           Align(
//                             alignment: Alignment.topRight,
//                             child: GestureDetector(
//                               onTap: () {
//
//                               },
//                               child: Text(
//                                 "Forgot password?",
//                                 style: GoogleFonts.poppins(
//                                   fontSize: 12,
//                                   fontWeight: FontWeight.w600,
//                                   color: const Color(0xff3B6985),
//                                 ),
//                               ),
//                             ),
//                           ),
//                           SizedBox(height: 32.h),
//                           // Login button with validation
//                           Button(
//                             title: 'Login',
//                             onTap: () async {
//
//                               if (_formKey.currentState?.validate() ?? false) {
//                                 // final credentials = {
//                                 //   'email': emailController.text,
//                                 //   'password': passwordController.text,
//                                 // };
//                                 // final response = await value.signInFunction(credentials, context);
//                                 // print('Response------>${response.toString()}');
//
//                               }
//                             },
//                             isLoading: false,
//                             color: Colors.teal,
//                           ),
//                           SizedBox(
//                             height: 35.h,
//                           ),
//
//                           Row(
//                             children: <Widget>[
//                               Expanded(
//                                 child: Divider(
//                                   thickness: 1,
//                                   color: const Color(0xff000066).withOpacity(0.45),
//                                 ),
//                               ),
//                               Padding(
//                                 padding: EdgeInsets.symmetric(horizontal: 8.0.sp),
//                                 child: Text(
//                                   'or continue with',
//                                   style: GoogleFonts.lato(
//                                       color: const Color(0xff787878),
//                                       fontSize: 12.sp,
//                                       fontWeight: FontWeight.w600),
//                                 ),
//                               ),
//                               Expanded(
//                                 child: Divider(
//                                   thickness: 1,
//                                   color: const Color(0xff000066).withOpacity(0.45),
//                                 ),
//                               ),
//                             ],
//                           ),
//                           SizedBox(
//                             height: 32.h,
//                           ),
//
//
//
//
//                         ],
//                       ),
//                     ),
//                     // RichText at the bottom of the screen
//                     Align(
//                       alignment: Alignment.bottomCenter,
//                       child: Padding(
//                         padding: EdgeInsets.only(top: 100.h),
//                         // Add padding to control the bottom space
//                         child: RichText(
//                           text: TextSpan(
//                             text: 'Don’t have an account? ',
//                             children: <TextSpan>[
//                               TextSpan(
//                                 text: 'Sign Up',
//                                 recognizer: TapGestureRecognizer()
//                                   ..onTap = () {
//                                   },
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//                     SizedBox(height: 20.h,),
//                   ],
//                 ),
//
//         ),
//       ),
//     );
//   }
// }