import 'package:flutter/material.dart';

import 'notification screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Home',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          // Builder(
          //   builder: (context) => IconButton(
          //     icon: const Icon(Icons.menu), // Menu icon to open the drawer
          //     onPressed: () {
          //       Scaffold.of(context).openEndDrawer(); // Open right-side drawer
          //     },
          //   ),
          // ),
        ],
      ),

      drawer: Drawer(
        width: 250,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(100),
            bottomRight: Radius.circular(20),
          ),
        ),        backgroundColor: Colors.teal.shade100,
        child: ListView(
          children: [
            DrawerHeader(
                child: Column(
              children: [
                Icon(Icons.person),
                Text('John Doe'),
              ],
            )),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Divider(color: Colors.red,thickness: 4.0,),
            ),
            ListTile(
              leading: Image.asset(
                'assets/116 home simple.png',
                scale: 3,
              ),
              title: Text('Setting'),
              trailing: Icon(Icons.arrow_forward_ios_rounded),
            ),
            ListTile(
              leading: Icon(Icons.notification_add),
              title: Text('Notification'),
              trailing: Icon(Icons.arrow_forward_ios_rounded),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => NotificationScreen()));
              },
            )
          ],
        ),
      ),

      // drawer: Drawer(
      //   child: ListView(
      //     children: [
      //       const DrawerHeader(
      //           decoration: BoxDecoration(
      //             color: Colors.teal,
      //           ),
      //           child: Text('Menu')),
      //       ListTile(
      //         leading: const Icon(Icons.add),
      //         title: const Text('Add'),
      //         onTap: () {
      //           print('tapped----->');
      //         },
      //       )
      //     ],
      //   ),
      // ),
      // endDrawer: Drawer(
      //   backgroundColor: Colors.white,
      //   child: ListView(
      //     children: [
      //       DrawerHeader(child: Text('End Dreawer')),
      //       ListTile(
      //         leading: Icon(Icons.home),
      //         title: Text('Home'),
      //         onTap: (){},
      //       ),
      //       ListTile(
      //         leading: Icon(Icons.notification_add),
      //         title: Text('Notification'),
      //         onTap: (){
      //           Navigator.push(context, MaterialPageRoute(builder: (context) => NotificationScreen()));
      //         },
      //       ),
      //     ],
      //   ),
      // ),
      body: const Center(
        child: Text(
          'Welcome to Home Screen!',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
