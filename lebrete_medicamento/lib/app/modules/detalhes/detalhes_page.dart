import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:lebrete_medicamento/app/modules/detalhes/components/ItemDose.dart';
import 'detalhes_controller.dart';

class DetalhesPage extends StatefulWidget {
  final String title;
  final bool comprimido;
  final String tag;

  const DetalhesPage(
      {Key key, this.title = "Detalhes", this.comprimido, this.tag})
      : super(key: key);

  @override
  _DetalhesPageState createState() => _DetalhesPageState();
}

class _DetalhesPageState
    extends ModularState<DetalhesPage, DetalhesController> {
  bool _ativar = false;

  @override
  void initState() {
    _init();

    super.initState();
  }

  _init() async {
    await Future.delayed(Duration(milliseconds: 200), () {
      setState(() {
        _ativar = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          widget.comprimido ? Colors.deepOrange : Colors.blueAccent,
      body: Scrollbar(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor:
                  widget.comprimido ? Colors.deepOrange : Colors.blueAccent,
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
                          tag: widget.tag,
                          child: widget.comprimido
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
                            'Dipirona',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 50,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            '02 X 10 ml',
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
                    //height: MediaQuery.of(context).size.height * 0.9,
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
                          height: 15,
                        ),
                        Text(
                          'Remédio para dor de cabeça',
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
                          height: 40,
                        ),
                        ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: 10,
                          itemBuilder: (_, i) {
                            return ItemDose();
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
