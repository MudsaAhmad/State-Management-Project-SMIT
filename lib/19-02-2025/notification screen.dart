import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:state_management_project_smit/19-02-2025/notification_service.dart';
import 'package:state_management_project_smit/19-02-2025/testing_screen.dart';
import 'package:state_management_project_smit/componants/button.dart';
import 'package:state_management_project_smit/componants/email_text_field.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  final nameController = TextEditingController();
  final titleController = TextEditingController();
  final bodyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: const Text('Notification Screen'),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // TextEmailField(title: 'enter title', controller: titleController),
            // SizedBox(height: 20,),
            // TextEmailField(title: 'enter body', controller: bodyController),
            // SizedBox(height: 20,),

            TextEmailField(title: 'enter name', controller: nameController),

            SizedBox(
              height: 20,
            ),

            TextEmailField(title: 'enter title', controller: titleController),
            SizedBox(
              height: 20,
            ),
            TextEmailField(title: 'enter body', controller: bodyController),
            SizedBox(
              height: 20,
            ),

            Button(
                title: 'Show Notification',
                onTap: () async {
                  await storeDataInSP();

                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => TestingScreen()));

                  // NotificationServiceClass.showNotification(
                  //     id: 1,
                  //     title: titleController.text,
                  //     body: bodyController.text,
                  //
                  //     // title: titleController.text,
                  //     // body: bodyController.text);
                  // // notification function calling.
                  // );
                },
                isLoading: false,
                color: Colors.teal),
          ],
        ),
      ),
    );
  }

  Future<void> storeDataInSP() async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('action', 'Start');

      print('Name stored in SharedPreferences');
    } catch (e) {
      print('Error storing data: $e');
    }
  }
}
