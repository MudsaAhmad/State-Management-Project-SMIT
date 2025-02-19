import 'dart:io';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;
import 'package:flutter_timezone/flutter_timezone.dart';

class NotificationService {
  int id = 0;

  static final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  // initialize notification

  static Future<void> initialize() async {
    const AndroidInitializationSettings androidInitializationSettings =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    const InitializationSettings initializationSettings =
        InitializationSettings(android: androidInitializationSettings);

    await flutterLocalNotificationsPlugin.initialize(initializationSettings);

    // Load timezone data
    tz.initializeTimeZones();
    final String currentTimeZone = await FlutterTimezone.getLocalTimezone();
    tz.setLocalLocation(tz.getLocation(currentTimeZone));

    // This function will take the notification permission.
    _requestPermission();
  }

  static Future<void> _requestPermission() async {
    final bool? isNotificationGranted = await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.requestNotificationsPermission();

    if (isNotificationGranted != null && isNotificationGranted) {
      print('notification permission granted---------->');
    } else {
      print('Notification permission denied/cancel---------->');
    }

    // Request exact alarm permission (Android 12+)
    if (Platform.isAndroid) {
      if (await Permission.scheduleExactAlarm.request().isGranted) {
        print('Exact alarm permission granted ✅');
      } else {
        print('Exact alarm permission denied ❌');
      }
    }
  }

  static Future<void> showNotification({
    required int id,
    required String title,
    required String body,
  }) async {
    AndroidNotificationDetails androidNotificationDetails =
        const AndroidNotificationDetails(
            "high_performance_channel", "High Importance Notifications",
            importance: Importance.max, priority: Priority.high);

    NotificationDetails notificationDetails =
        NotificationDetails(android: androidNotificationDetails);

    await flutterLocalNotificationsPlugin.show(
        id, title, body, notificationDetails);
  }

  // Schedule a notification
  static Future<void> scheduleNotification({
    int id = 1,
    required String title,
    required String body,
    required int hour,
    required int minute,
  }) async {
    final now = tz.TZDateTime.now(tz.local);

    // Ensure the scheduled time is at least 5 seconds in the future

    var scheduleTime = tz.TZDateTime(
      tz.local,
      now.year,
      now.month,
      now.day,
      hour,
      minute, // Add 1 minute to the current time
    );

    // if (scheduleTime.isBefore(now)) {
    //   // If the schedule time is before the current time, add a minute.
    //   scheduleTime = scheduleTime.add(const Duration(minutes: 1));
    //   print("⚠️ Adjusted scheduled time to: ${scheduleTime.toIso8601String()}");
    // }

    // print("🔔 Scheduling notification for: ${scheduleTime.toString()}");
    //
    // // Convert to the local timezone
    //  final tz.TZDateTime tzScheduledTime = tz.TZDateTime.from(scheduleTime, tz.local);
    //
    // print("🔔 Scheduling notification for: ${tzScheduledTime.toString()}");
    // print("Local time: ${tzScheduledTime.add(Duration(hours: 0)).toLocal()}");  // Added for clarification

    await flutterLocalNotificationsPlugin.zonedSchedule(
      id,
      title,
      body,
      scheduleTime,
      const NotificationDetails(
        android: AndroidNotificationDetails(
          "scheduled_channel",
          "Scheduled Notifications",
          importance: Importance.max,
          priority: Priority.high,
        ),
      ),
      androidScheduleMode: AndroidScheduleMode.inexactAllowWhileIdle,
      matchDateTimeComponents: DateTimeComponents.time,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
    );

    print("✅ Notification scheduled at: ${scheduleTime.toString()}");
  }

  Future<void> cancelAllNotifications() async {
    await flutterLocalNotificationsPlugin.cancelAll();
  }
}
