import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ItemLembrete extends StatelessWidget {
  final String nome;
  final String ml;
  final String time;
  final Function onPressed;
  const ItemLembrete({Key key, this.nome, this.ml, this.time, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    DateTime data = DateTime.parse("$time");

    return Container(
      margin: EdgeInsets.only(bottom: 40),
      height: 170,
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        gradient: LinearGradient(
          colors: [
            Colors.blue.shade200,
            Colors.greenAccent.shade400,
          ],
          end: Alignment.bottomCenter,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.all(10),
                  child: Icon(
                    Icons.medical_services_rounded,
                    size: 25,
                    color: Colors.white,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white38,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AutoSizeText(
                        nome,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        presetFontSizes: [25, 30, 15],
                      ),
                      AutoSizeText(
                        'Tomar ${ml} ml',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        presetFontSizes: [20, 30, 15],
                      ),
                      AutoSizeText(
                        'Data: ${DateFormat('dd/MM/yyyy').format(data)} | Hora: ${DateFormat.jm().format(data)}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        presetFontSizes: [18, 19, 15],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 40,
            child: FloatingActionButton.extended(
              heroTag: null,
              backgroundColor: Colors.blue,
              label: Text('Tomar seu medicameto'),
              icon: Icon(Icons.check),
              elevation: 2,
              onPressed: onPressed,
            ),
          ),
        ],
      ),
    );
  }
}
