import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:lebrete_medicamento/app/modules/home/components/cardAlerta.dart';
import 'package:lebrete_medicamento/app/modules/telaLembrete/components/itemLembrete.dart';
import 'package:lebrete_medicamento/app/utils/utils.dart';
import 'tela_lembrete_controller.dart';

class TelaLembretePage extends StatefulWidget {
  final String title;
  const TelaLembretePage({Key key, this.title = "TelaLembrete"})
      : super(key: key);

  @override
  _TelaLembretePageState createState() => _TelaLembretePageState();
}

class _TelaLembretePageState
    extends ModularState<TelaLembretePage, TelaLembreteController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SizedBox(
                height: 30,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: BackButton(),
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  Container(
                    width: largura * 0.6,
                    child: AutoSizeText(
                      'Está na hora do\nseu medicamento!',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xff264771),
                        fontSize: 40,
                      ),
                      maxLines: 2,
                    ),
                  ),
                  Expanded(
                    child: Container(),
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
              Observer(builder: (_) {
                if (controller.listarLembrete.result != null) {
                  return ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: controller.listarLembrete.value.length,
                    itemBuilder: (_, i) {
                      return ItemLembrete(
                        nome: controller.listarLembrete.value
                            .elementAt(i)['nome'],
                        ml: controller.listarLembrete.value
                            .elementAt(i)['qtdDiaria']
                            .toString(),
                        time: controller.listarLembrete.value
                            .elementAt(i)['time'],
                        onPressed: () async {
                          await showDialog(
                            context: context,
                            child: AlertDialog(
                              title: Text('Já tomou o Medicamento?'),
                              content: Text(
                                'Se você já tomou esse remédio click em SIM.',
                              ),
                              actions: [
                                MaterialButton(
                                  child: Text('Não'),
                                  color: Colors.red,
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                ),
                                MaterialButton(
                                  color: Colors.green,
                                  child: Text('Sim'),
                                  onPressed: () async {
                                    await controller.tomarRemedio(controller
                                        .listarLembrete.value
                                        .elementAt(i)['id']);
                                    Navigator.pop(context);
                                  },
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    },
                  );
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              }),
            ],
          ),
        ),
      ),
    );
  }
}
