import 'package:flutter/material.dart';

class ItemDose extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 30),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Container(
          height: 120,
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
                              'Dipirona Sódica',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 30,
                                color: Colors.blueGrey.shade800,
                              ),
                            ),
                            Text(
                              'Data: 05/12/2020',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 17,
                                color: Colors.blueGrey.shade200,
                              ),
                            ),
                            Text(
                              'Horário: 1:08pm',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 17,
                                color: Colors.blueGrey.shade200,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Visibility(
                          visible: true,
                          child: Icon(
                            Icons.check_circle,
                            size: 70,
                            color: Colors.greenAccent.shade400,
                          ),
                          replacement: Icon(
                            Icons.info,
                            size: 70,
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
                color: true ? Colors.greenAccent.shade400 : Colors.red.shade400,
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
