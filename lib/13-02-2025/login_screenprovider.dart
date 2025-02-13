import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:state_management_project_smit/13-02-2025/login_provider.dart';
import 'package:state_management_project_smit/componants/button.dart';
import 'package:state_management_project_smit/componants/email_text_field.dart';
import 'package:state_management_project_smit/componants/password_text_field.dart';

class LoginScreenprovider extends StatefulWidget {
  const LoginScreenprovider({super.key});

  @override
  State<LoginScreenprovider> createState() => _LoginScreenproviderState();
}

final emailController = TextEditingController();
final passwordController = TextEditingController();

final _formKey = GlobalKey<FormState>();

class _LoginScreenproviderState extends State<LoginScreenprovider> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: const Text('Login with provider'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Consumer<LoginProvider>(builder: (context, value, child) {
          return Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                TextEmailField(
                  title: 'enter your email',
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  prefixImagePath: 'assets/Layer 2.png',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 20.h,
                ),
                TextPasswordField(
                  title: 'enter your password',
                  controller: passwordController,
                  keyboardType: TextInputType.text,
                  prefixImagePath: 'assets/Layer 2.png',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    if (value.length < 6) {
                      return 'Password must be at least 6 characters long';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 40.h,
                ),
                Button(
                    title: 'Login',
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        value.loginAPIFunction(context, emailController.text,
                            passwordController.text);
                      } else {}
                    },
                    isLoading: value.loading,
                    color: Colors.teal),
              ],
            ),
          );
        }),
      ),
    );
  }
}
