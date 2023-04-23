import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationServices {
  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
  FlutterLocalNotificationsPlugin();

  final AndroidInitializationSettings _androidInitializationSettings = const
  AndroidInitializationSettings('notification_icon');

  void initializeNotification() async {
    InitializationSettings initialSettings =
    InitializationSettings(android: _androidInitializationSettings);
    await _flutterLocalNotificationsPlugin.initialize(initialSettings).then((value){
      print("Is okay");
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
}
