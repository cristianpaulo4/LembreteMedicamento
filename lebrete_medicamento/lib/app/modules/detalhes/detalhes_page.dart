import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:lebrete_medicamento/app/modules/detalhes/components/ItemDose.dart';
import 'package:lebrete_medicamento/model/medicamentoModel.dart';
import 'detalhes_controller.dart';

class DetalhesPage extends StatefulWidget {
  final MedicamentoModel model;
  const DetalhesPage({Key key, this.model}) : super(key: key);

  @override
  _DetalhesPageState createState() => _DetalhesPageState();
}

class _DetalhesPageState
    extends ModularState<DetalhesPage, DetalhesController> {
  @override
  void initState() {
    controller.init(widget.model.id);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.model.comprimido
          ? Colors.deepOrange.shade400
          : Colors.blueAccent,
      body: Scrollbar(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: widget.model.comprimido
                  ? Colors.deepOrange.shade400
                  : Colors.blueAccent,
              actions: [
                IconButton(
                  icon: Icon(Icons.more_horiz),
                  color: Colors.white,
                  onPressed: () {},
                )
              ],
              expandedHeight: 250.0,
              flexibleSpace: FlexibleSpaceBar(
                collapseMode: CollapseMode.parallax,
                background: Padding(
                  padding: const EdgeInsets.all(40),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        alignment: Alignment.bottomCenter,
                        child: Hero(
                          tag: widget.model.id.toString(),
                          child: widget.model.comprimido
                              ? Image.asset(
                                  'lib/assets/comp.png',
                                  width: 80,
                                )
                              : Image.asset(
                                  'lib/assets/xarope.png',
                                  width: 80,
                                ),
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            '${widget.model.nome}',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 50,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            '02 X ${widget.model.qtdDiaria} ml',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                titlePadding: EdgeInsets.only(bottom: 25),
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                <Widget>[
                  Container(
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
                        Text(
                          'DESCRIÇÃO',
                          style: TextStyle(
                            fontSize: 17,
                            color: Colors.blueGrey.shade300,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          widget.model.descricao,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                            color: Colors.blueGrey.shade800,
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Text(
                          'INTERVALOS',
                          style: TextStyle(
                            fontSize: 17,
                            color: Colors.blueGrey.shade300,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          widget.model.intervalos.toString() + ' H',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                            color: Colors.blueGrey.shade800,
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Text(
                          'QUANTIDADES DE DOSES',
                          style: TextStyle(
                            fontSize: 17,
                            color: Colors.blueGrey.shade300,
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Observer(
                          builder: (_) {
                            if (controller.listarDoses.result != null) {
                              return ListView.builder(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: controller.listarDoses.value.length,
                                itemBuilder: (_, i) {
                                  return ItemDose(
                                    time: controller.listarDoses.value
                                        .elementAt(i)
                                        .time,
                                    ok: controller.listarDoses.value
                                        .elementAt(i)
                                        .ok,
                                  );
                                },
                              );
                            } else {
                              return Center(child: CircularProgressIndicator());
                            }
                          },
                        ),
                        SizedBox(
                          height: 180,
                        ),
                      ],
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
