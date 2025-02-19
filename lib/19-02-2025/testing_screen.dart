
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:state_management_project_smit/componants/button.dart';

class TestingScreen extends StatefulWidget {
  const TestingScreen({super.key});

  @override
  State<TestingScreen> createState() => _TestingScreenState();
}

class _TestingScreenState extends State<TestingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
        child: Column(
          children: [
            SizedBox(height: 50,),
            Text('Name'),

            Button(title: 'Show name', onTap: () async {

              final SharedPreferencesAsync asyncPrefs = SharedPreferencesAsync();

              await asyncPrefs.setString('action', 'Start');

              final String? action = await asyncPrefs.getString('action');

              print('name------>$action');

          //    await asyncPrefs.remove('repeat');

// Any time a filter option is included as a method parameter, strongly consider
// using it to avoid potentially unwanted side effects.
            //  await asyncPrefs.clear(allowList: <String>{'action', 'repeat'});

            }, isLoading: false, color: Colors.teal),

          ],
        ),
      ),

    );
  }

  Future<void> getName() async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
       String name = await prefs.getString('action').toString();

       print('name--->$name');



      print('Name stored in SharedPreferences');
    } catch (e) {
      print('Error storing data: $e');
    }
  }


}
