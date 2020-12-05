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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          comprimido ? Colors.deepOrange.shade400 : Colors.blueAccent,
      body: Scrollbar(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor:
                  comprimido ? Colors.deepOrange.shade400 : Colors.blueAccent,
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
                                child: RadioListTile(
                                  title: Text('Xarope'),
                                  groupValue: comprimido,
                                  value: false,
                                  onChanged: (x) {
                                    setState(() {
                                      comprimido = x;
                                    });
                                  },
                                ),
                              ),
                              Expanded(
                                child: RadioListTile(
                                  title: Text('Comprimido'),
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
                            hint: 'Total em ML do Medicamento',
                            erro: 'Total inválido',
                            controller: _totalml,
                            keyboardType: TextInputType.number,
                          ),
                          Input(
                            hint: 'ML Diária',
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
                          SizedBox(
                            height: 30,
                          ),
                          SizedBox(
                            height: 65,
                            child: FloatingActionButton.extended(
                              backgroundColor:
                                  comprimido ? Colors.deepOrange : Colors.blue,
                              label: Text(
                                'Salvar',
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                              onPressed: () {
                                if (_formkey.currentState.validate()) {
                                  controller.cadastroMedicamento(
                                    MedicamentoModel(
                                      nome: _nome.text,
                                      descricao: _descricao.text,
                                      qtdTotal: int.parse(_totalml.text),
                                      qtdDiaria: int.parse(_ml.text),
                                      intervalos: int.parse(_intervalo.text),
                                      comprimido: comprimido,
                                    ),
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
    );
  }
}
