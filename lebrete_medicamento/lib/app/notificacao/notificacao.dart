import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:lebrete_medicamento/model/medicamentoModel.dart';

class Notificacao {
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  AndroidInitializationSettings androidInitializationSettings;
  InitializationSettings initializationSettings;

  // criar notificação
  Future<void> notificationAfterSec(
    int id,
    DateTime time,
    MedicamentoModel model,
  ) async {
    AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails(
      'second channel ID',
      'second Channel title',
      'second channel body',
      priority: Priority.high,
      importance: Importance.max,
      ticker: 'test',
    );
    // criar notificação
    NotificationDetails notificationDetails = NotificationDetails(
      android: androidNotificationDetails,
    );

    await flutterLocalNotificationsPlugin.schedule(
      id,
      '${model.nome}',
      'Está na hora de tomar seu medicamento!!',
      time,
      notificationDetails,
      androidAllowWhileIdle: true,
    );
  }
}
