import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationServiceClass {
  static final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static Future<void> initializeNotification() async {
    AndroidInitializationSettings androidInitializationSettings =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    InitializationSettings initializationSettings = InitializationSettings(android: androidInitializationSettings);

    await flutterLocalNotificationsPlugin.initialize(initializationSettings);


    // request permission from user for notification

    _requestPermission();

  }


static Future<void> _requestPermission() async {

    print('enter in function--------->');

  final bool? isNotificationGranted = await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.requestNotificationsPermission();

  if (isNotificationGranted != null && isNotificationGranted) {
    print('notification permission granted---------->');
  } else {
    print('Notification permission denied/cancel---------->');
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



  // static final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
  //     FlutterLocalNotificationsPlugin();
  //
  // // initialize notification
  //
  // static Future<void> initialize() async {
  //   const AndroidInitializationSettings androidInitializationSettings =
  //       AndroidInitializationSettings('@mipmap/ic_launcher');
  //
  //   const InitializationSettings initializationSettings =
  //       InitializationSettings(android: androidInitializationSettings);
  //
  //   await flutterLocalNotificationsPlugin.initialize(initializationSettings);
  //
  //   // This function will take the notification permission.
  //   _requestPermission();
  // }
  //
  // static Future<void> _requestPermission() async {
  //   final bool? isNotificationGranted = await flutterLocalNotificationsPlugin
  //       .resolvePlatformSpecificImplementation<
  //           AndroidFlutterLocalNotificationsPlugin>()
  //       ?.requestNotificationsPermission();
  //
  //   if (isNotificationGranted != null && isNotificationGranted) {
  //     print('notification permission granted---------->');
  //   } else {
  //     print('Notification permission denied/cancel---------->');
  //   }
  // }
  //
  // static Future<void> showNotification({
  //   required int id,
  //   required String title,
  //   required String body,
  // }) async {
  //   AndroidNotificationDetails androidNotificationDetails =
  //       const AndroidNotificationDetails(
  //           "high_performance_channel", "High Importance Notifications",
  //           importance: Importance.max, priority: Priority.high);
  //
  //   NotificationDetails notificationDetails =
  //       NotificationDetails(android: androidNotificationDetails);
  //
  //   await flutterLocalNotificationsPlugin.show(
  //       id, title, body, notificationDetails);
  // }
}
