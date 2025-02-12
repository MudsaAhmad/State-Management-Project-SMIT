import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management_project_smit/12-02-2025/first_screen.dart';

import '11-01-2025/number_provider.dart';
import '12-02-2025/numbers_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
      // ChangeNotifierProvider(create: (context) => NumberProvider()),
        ChangeNotifierProvider(create: (context) => NumbersProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: FirstScreen(),
      ),
    );
  }
}
