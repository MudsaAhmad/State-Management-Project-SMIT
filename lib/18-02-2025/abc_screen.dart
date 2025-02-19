import 'package:flutter/material.dart';
import 'package:state_management_project_smit/18-02-2025/service.dart';
import 'package:state_management_project_smit/componants/button.dart';

class AbcScreen extends StatefulWidget {
  const AbcScreen({super.key});

  @override
  State<AbcScreen> createState() => _AbcScreenState();
}

class _AbcScreenState extends State<AbcScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ABC Screen'),
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu), // Menu icon to open the drawer
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.teal),
              child: const Text(
                'Menu',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.notifications),
              title: const Text('Notifications'),
              onTap: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => NotificationScreen()),
                // );
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 20),
            Button(
              title: 'Show Notification',
              onTap: () {
                NotificationService.showNotification(
                  id: 1,
                  title: 'This is title',
                  body: 'This is body!!',
                );
              },
              isLoading: false,
              color: Colors.teal,
            ),
            
          ],
        ),
      ),
    );
  }
}
