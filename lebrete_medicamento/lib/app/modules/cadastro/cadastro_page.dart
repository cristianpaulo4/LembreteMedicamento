import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:lebrete_medicamento/app/modules/cadastro/components/input.dart';
import 'package:lebrete_medicamento/model/medicamentoModel.dart';
import 'cadastro_controller.dart';

class CadastroPage extends StatefulWidget {
  final String title;
  const CadastroPage({Key key, this.title = "Cadastro"}) : super(key: key);

  @override
  _CadastroPageState createState() => _CadastroPageState();
}

class _CadastroPageState
    extends ModularState<CadastroPage, CadastroController> {
  TextEditingController _nome = TextEditingController();
  TextEditingController _descricao = TextEditingController();
  TextEditingController _totalml = TextEditingController();
  TextEditingController _ml = TextEditingController();
  TextEditingController _intervalo = TextEditingController();
  bool comprimido = false;
  GlobalKey<FormState> _formkey = GlobalKey();
  var hora = TimeOfDay.now();
  DateTime dataInicio;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
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
          ),
        ),
        child: Scrollbar(
          child: CustomScrollView(
            slivers: [
              SliverAppBar(
                backgroundColor: Colors.transparent,
                expandedHeight: 120,
                flexibleSpace: FlexibleSpaceBar(
                  title: Text('Cadastrar Medicamento'),
                  centerTitle: true,
                ),
              ),
              SliverList(
                delegate: SliverChildListDelegate(
                  <Widget>[
                    Form(
                      key: _formkey,
                      child: Container(
                        padding: EdgeInsets.only(
                          top: 50,
                          left: 20,
                          right: 20,
                        ),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(40),
                            topRight: Radius.circular(40),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Container(
                              height: 70,
                              child: Visibility(
                                visible: comprimido,
                                child: Image.asset(
                                  'lib/assets/comp.png',
                                  width: 80,
                                ),
                                replacement: Image.asset(
                                  'lib/assets/xarope.png',
                                  width: 80,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: RadioListTile(
                                    title: AutoSizeText(
                                      'Xarope',
                                      style: TextStyle(
                                        fontSize: 18,
                                      ),
                                      maxLines: 1,
                                    ),
                                    groupValue: comprimido,
                                    value: false,
                                    onChanged: (x) {
                                      setState(() {
                                        comprimido = x;
                                        print(x);
                                      });
                                    },
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: RadioListTile(
                                    title: AutoSizeText(
                                      'Comprimido',
                                      style: TextStyle(
                                        fontSize: 18,
                                      ),
                                      maxLines: 1,
                                    ),
                                    groupValue: comprimido,
                                    value: true,
                                    onChanged: (x) {
                                      setState(() {
                                        comprimido = x;
                                      });
                                    },
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Input(
                              hint: 'Nome',
                              erro: 'Nome inválido',
                              controller: _nome,
                            ),
                            Input(
                              hint: 'Descrição',
                              erro: 'Descrição inválida',
                              controller: _descricao,
                            ),
                            Input(
                              hint: 'Total em ML ou Unidade',
                              erro: 'Total inválido',
                              controller: _totalml,
                              keyboardType: TextInputType.number,
                            ),
                            Input(
                              hint: 'ML ou Unid. Diária',
                              erro: 'ML inválida',
                              controller: _ml,
                              keyboardType: TextInputType.number,
                            ),
                            Input(
                              hint: 'Intervalos em horas',
                              erro: 'Intervalos inválidos',
                              controller: _intervalo,
                              keyboardType: TextInputType.number,
                            ),
                            Row(
                              children: [
                                Text(
                                  'Inicio ás: ${hora.format(context)}',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                FloatingActionButton(
                                  backgroundColor: Colors.white,
                                  heroTag: null,
                                  mini: true,
                                  child: Icon(
                                    Icons.timer,
                                    color: comprimido
                                        ? Colors.deepOrange
                                        : Colors.blue,
                                  ),
                                  onPressed: () async {
                                    var res = await showTimePicker(
                                      initialTime: TimeOfDay.now(),
                                      context: context,
                                    );
                                    if (res != null) {
                                      setState(() {
                                        hora = res;
                                      });
                                    }
                                    DateTime data = DateTime.now();
                                    dataInicio = data
                                        .add(
                                          Duration(
                                            hours: hora.hour,
                                            minutes: hora.minute,
                                          ),
                                        )
                                        .subtract(
                                          Duration(
                                            hours: DateTime.now().hour,
                                            minutes: DateTime.now().minute,
                                          ),
                                        );
                                  },
                                )
                              ],
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            SizedBox(
                              height: 65,
                              child: FloatingActionButton.extended(
                                backgroundColor: comprimido
                                    ? Colors.deepOrange
                                    : Colors.blue,
                                label: Text(
                                  'Salvar',
                                  style: TextStyle(
                                    fontSize: 20,
                                  ),
                                ),
                                onPressed: () async {
                                  if (_formkey.currentState.validate()) {
                                    if (dataInicio == null) {
                                      dataInicio = DateTime.now();
                                    }

                                    showDialog(
                                      barrierDismissible: false,
                                      context: context,
                                      child: AlertDialog(
                                        content: Row(
                                          children: [
                                            CircularProgressIndicator(),
                                            SizedBox(
                                              width: 20,
                                            ),
                                            Text('Aguarde...')
                                          ],
                                        ),
                                      ),
                                    );

                                    await controller.cadastroMedicamento(
                                      MedicamentoModel(
                                        nome: _nome.text,
                                        descricao: _descricao.text,
                                        qtdTotal: int.parse(_totalml.text),
                                        qtdDiaria: int.parse(_ml.text),
                                        intervalos: int.parse(_intervalo.text),
                                        comprimido: comprimido,
                                      ),
                                      dataInicio,
                                    );
                                  }
                                },
                              ),
                            ),
                            SizedBox(
                              height: 40,
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
