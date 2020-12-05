import 'package:flutter/material.dart';

class CardItem extends StatelessWidget {
  final bool comprimido;
  final String titulo;
  final String ml;
  final String detalhes;
  final Function onPressd;
  final String tag;
  const CardItem({
    Key key,
    this.comprimido,
    this.titulo,
    this.ml,
    this.detalhes,
    this.onPressd,
    this.tag,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 190,
      padding: EdgeInsets.all(25),
      margin: EdgeInsets.only(bottom: 15, top: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        gradient: LinearGradient(
          colors: comprimido
              ? [
                  Colors.orange.shade200,
                  Colors.deepOrangeAccent,
                ]
              : [
                  Colors.blue.shade200,
                  Colors.blue,
                ],
          end: Alignment.bottomCenter,
        ),
      ),
      child: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Visibility(
                  visible: comprimido,
                  child: Hero(
                    child: Image.asset('lib/assets/comp.png'),
                    tag: tag,
                  ),
                  replacement: Hero(
                    child: Image.asset('lib/assets/xarope.png'),
                    tag: tag,
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
                      Text(
                        '$titulo',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        '$ml ml',
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 30,
            child: Divider(
              height: 0,
              color: Colors.white,
              thickness: 2,
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '$detalhes',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 40,
                  child: FloatingActionButton.extended(
                    heroTag: null,
                    backgroundColor: comprimido
                        ? Colors.deepOrange.shade300
                        : Colors.blue.shade300,
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
