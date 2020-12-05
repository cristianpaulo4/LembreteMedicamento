import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:lebrete_medicamento/app/modules/home/components/cardAlerta.dart';
import 'package:lebrete_medicamento/app/modules/home/components/cardItem.dart';
import 'package:lebrete_medicamento/model/medicamentoModel.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  AndroidInitializationSettings androidInitializationSettings;
  InitializationSettings initializationSettings;

  @override
  void initState() {
    init();
    super.initState();
  }

  init() async {
    androidInitializationSettings = AndroidInitializationSettings(
      'app_icon',
    );
    initializationSettings = InitializationSettings(
      android: androidInitializationSettings,
    );
    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onSelectNotification: onSelectNotification,
    );
    /* const AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
      'repeating channel id',
      'repeating channel name',
      'repeating description',
    );
    const NotificationDetails platformChannelSpecifics = NotificationDetails(
      android: androidPlatformChannelSpecifics,
    );

    await flutterLocalNotificationsPlugin.periodicallyShow(
      0,
      'repeating title',
      'repeating body',
      RepeatInterval.everyMinute,
      platformChannelSpecifics,
      androidAllowWhileIdle: true,
    ); */
  }

  // selecionar notificação
  Future onSelectNotification(String payLoad) {
    if (payLoad != null) {
      print(payLoad);
    }
  }

  Future<void> notificationAfterSec() async {
    /* AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails(
      'second channel ID',
      'second Channel title',
      'second channel body',
      priority: Priority.high,
      importance: Importance.max,
      ticker: 'test',
    );

    NotificationDetails notificationDetails = NotificationDetails(
      android: androidNotificationDetails,
    );

    for (var i = 0; i < 5; i++) {
      var timeDelayed = DateTime.now().add(Duration(minutes: (1 * i)));
      print(timeDelayed);

      await flutterLocalNotificationsPlugin.schedule(
        i,
        'Ola, $i',
        'está tudo dando certo',
        timeDelayed,
        notificationDetails,
        androidAllowWhileIdle: true,
      );
    } */
  }

  Future<void> notification() async {
    AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails(
      'Channel ID',
      'Channel title',
      'channel body',
      priority: Priority.high,
      importance: Importance.max,
      ticker: 'test',
    );

    NotificationDetails notificationDetails = NotificationDetails(
      android: androidNotificationDetails,
    );
    await flutterLocalNotificationsPlugin.show(
      0,
      'Hello there',
      'please subscribe my channel',
      notificationDetails,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 60,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Olá, Bem-Vindo ao',
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.black45,
                        ),
                      ),
                      Text(
                        'Time Medical',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 45,
                          color: Color(0xff264771),
                        ),
                      ),
                    ],
                  ),
                  Icon(
                    Icons.medical_services,
                    size: 60,
                    color: Color(0xff264771),
                  )
                ],
              ),
              SizedBox(
                height: 30,
              ),
              CardAlerta(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.6,
                        child: Text(
                          'Seus Medicamentos',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 35,
                            color: Color(0xff264771),
                          ),
                        ),
                      ),
                      Text(
                        'na hora certa',
                        style: TextStyle(
                          fontSize: 25,
                          color: Color(0xff264771),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Text(
                        '3 de medicamentos',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black45,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    height: 250,
                    alignment: Alignment.bottomCenter,
                    child: Image.asset(
                      'lib/assets/amp.png',
                      height: 180,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                'Medicamentos',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  color: Color(0xff264771),
                ),
              ),
              Observer(
                builder: (_) {
                  if (controller.listarMedicamentos != null) {
                    return ListView.builder(
                      itemCount: controller.listarMedicamentos.length,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (_, i) {
                        MedicamentoModel model = MedicamentoModel(
                          id: controller.listarMedicamentos.elementAt(i)['id'],
                          nome: controller.listarMedicamentos
                              .elementAt(i)['nome'],
                          descricao: controller.listarMedicamentos
                              .elementAt(i)['descricao'],
                          qtdDiaria: controller.listarMedicamentos
                              .elementAt(i)['qtdDiaria'],
                          comprimido: controller.listarMedicamentos
                                      .elementAt(i)['comprimido'] ==
                                  '1'
                              ? true
                              : false,
                        );

                        return CardItem(
                          titulo: model.nome,
                          detalhes: model.descricao,
                          ml: model.qtdDiaria.toString(),
                          comprimido: model.comprimido,
                          tag: model.id.toString(),
                          onPressd: () {
                            Modular.to.pushNamed(
                              '/detalhes',
                              arguments: {'tag': '1', 'comp': true},
                            );
                          },
                        );
                      },
                    );
                  } else {
                    return Center(child: CircularProgressIndicator.adaptive());
                  }
                },
              ),
              SizedBox(
                height: 60,
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Color(0xff4FCD9F),
        label: Text('Adicionar'),
        icon: Icon(Icons.add),
        onPressed: () {
          Modular.to.pushNamed('/cadastro');
        },
      ),
    );
  }
}
