import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:go_router/go_router.dart';
import 'package:walkmate/config/route/app_routes.dart';

import '../../config/route/app_pages.dart';

class NotificationServices {
  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
  FlutterLocalNotificationsPlugin();

  final AndroidInitializationSettings _androidInitializationSettings = const
  AndroidInitializationSettings('notification_icon');

  initializeNotification() async {
    InitializationSettings initialSettings =
    InitializationSettings(android: _androidInitializationSettings);
    await _flutterLocalNotificationsPlugin.initialize(initialSettings,onDidReceiveNotificationResponse: onDidReceiveNotificationResponse).then((value){
      print(value.toString());
    });
  }

  sendNotifications(String title, String body) async {
    AndroidNotificationDetails androidNotificationDetails =
    const AndroidNotificationDetails('channelId', 'channelName',
        importance: Importance.max, priority: Priority.high);

    NotificationDetails notificationDetails =
    NotificationDetails(android: androidNotificationDetails);
    await _flutterLocalNotificationsPlugin.show(
        0, title, body, notificationDetails);
  }


  onDidReceiveNotificationResponse(NotificationResponse notificationResponse) async {
    final String? payload = notificationResponse.payload;
    if (notificationResponse.payload != null) {
    }
    AppPages.router.pushNamed(
        AppRoutes.congrats,
        queryParams: {'isComplete': '1'}
        );
  }
}
