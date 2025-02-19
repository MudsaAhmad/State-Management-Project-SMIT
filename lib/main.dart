import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'package:state_management_project_smit/18-02-2025/service.dart';
import '11-01-2025/number_provider.dart';
import 'package:timezone/data/latest_all.dart' as tz;

import '19-02-2025/home_screen.dart';
import '19-02-2025/notification_service.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();

  // tz.initializeTimeZones();


  await NotificationServiceClass.initializeNotification();

 //await NotificationService.initialize();

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
      child: ChangeNotifierProvider(
        create: (context) => NumberProvider(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: HomeScreen(),
        ),
      ),
    );
  }
}
