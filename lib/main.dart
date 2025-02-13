import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:state_management_project_smit/13-02-2025/login_provider.dart';

import '11-01-2025/number_provider.dart';
import '12-02-2025/login_screen.dart';
import '12-02-2025/numbers_provider.dart';
import '13-02-2025/login_screenprovider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(393, 852),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MultiProvider(
        providers: [
        // ChangeNotifierProvider(create: (context) => NumberProvider()),
          ChangeNotifierProvider(create: (context) => NumbersProvider()),
          ChangeNotifierProvider(create: (context) => LoginProvider()),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: LoginScreenprovider(),
        ),
      ),
    );
  }
}
