import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class CardAlerta extends StatelessWidget {
  final String titulo;
  final String ml;
  final String detalhes;
  final Function onPressd;
  const CardAlerta({
    Key key,
    this.titulo,
    this.ml,
    this.detalhes,
    this.onPressd,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      padding: EdgeInsets.all(25),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        gradient: LinearGradient(
          colors: [
            Colors.greenAccent.shade200,
            Colors.greenAccent.shade400,
          ],
          end: Alignment.bottomCenter,
        ),
      ),
      child: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.all(10),
                  child: Icon(
                    Icons.notifications,
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
                        'Hora do Medicamentos',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        presetFontSizes: [25, 30, 15],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AutoSizeText(
                  'Medicamentos a serem tomados',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  presetFontSizes: [17],
                ),
                SizedBox(
                  height: 40,
                  child: FloatingActionButton.extended(
                    heroTag: null,
                    backgroundColor: Colors.greenAccent,
                    label: Text('Ver'),
                    icon: Icon(Icons.check),
                    elevation: 2,
                    onPressed: onPressd,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
