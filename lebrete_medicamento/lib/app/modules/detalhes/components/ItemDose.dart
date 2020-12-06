import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:intl/intl.dart';

class ItemDose extends StatelessWidget {
  final String time;
  final bool ok;
  const ItemDose({Key key, this.time, this.ok}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DateTime data = DateTime.parse("$time");

    return Container(
      margin: EdgeInsets.only(bottom: 30),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Container(
          height: 100,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Horário: ${DateFormat.jm().format(data)}',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.blueGrey.shade800,
                              ),
                            ),
                            Text(
                              'Data: ${DateFormat('dd/MM/yyyy').format(data)}',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.blueGrey.shade800,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Visibility(
                          visible: ok,
                          child: Icon(
                            Icons.check_circle,
                            size: 50,
                            color: Colors.greenAccent.shade400,
                          ),
                          replacement: Icon(
                            Icons.info,
                            size: 50,
                            color: Colors.red.shade400,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: 5,
                color: ok ? Colors.greenAccent.shade400 : Colors.red.shade400,
              )
            ],
          ),
        ),
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 5,
          )
        ],
      ),
    );
  }
}
