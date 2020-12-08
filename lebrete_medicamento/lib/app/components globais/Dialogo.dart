import 'package:flutter/material.dart';

class Dialogo extends StatelessWidget {
  final Function nao;
  final Function sim;
  final String titulo;
  final String texto;

  const Dialogo({Key key, this.nao, this.sim, this.titulo, this.texto})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              titulo,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              texto,
              style: TextStyle(
                fontSize: 15,
                color: Colors.black45,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              children: [
                Expanded(
                  child: FloatingActionButton.extended(
                    heroTag: null,
                    backgroundColor: Colors.red,
                    label: Text("Não"),
                    onPressed: nao,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: FloatingActionButton.extended(
                    heroTag: null,
                    label: Text("Sim"),
                    onPressed: sim,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
