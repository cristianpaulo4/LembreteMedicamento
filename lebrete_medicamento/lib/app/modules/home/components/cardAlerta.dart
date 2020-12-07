import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:lebrete_medicamento/app/utils/utils.dart';

class CardAlerta extends StatelessWidget {
  final bool medicamentosEmDia;
  final Function onPressd;
  const CardAlerta({
    Key key,
    this.medicamentosEmDia,
    this.onPressd,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: largura * 0.5,
      padding: EdgeInsets.all(25),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        gradient: LinearGradient(
          colors: medicamentosEmDia
              ? [
                  Colors.greenAccent.shade200,
                  Colors.greenAccent.shade400,
                ]
              : [
                  Colors.red.shade200,
                  Colors.red.shade400,
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
                    medicamentosEmDia ? Icons.check : Icons.info,
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
                        medicamentosEmDia
                            ? 'Você está em Dias!'
                            : 'Você não está Dias!',
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
                Container(
                  width: largura * 0.50,
                  child: AutoSizeText(
                    medicamentosEmDia
                        ? 'Você não possui medicamento \npara serem tomados.'
                        : 'Você possui medicamentos a \nserem tomados!',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    presetFontSizes: [17],
                  ),
                ),
                SizedBox(
                  height: 40,
                  child: FloatingActionButton.extended(
                    heroTag: null,
                    backgroundColor: medicamentosEmDia
                        ? Colors.greenAccent
                        : Colors.redAccent,
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
