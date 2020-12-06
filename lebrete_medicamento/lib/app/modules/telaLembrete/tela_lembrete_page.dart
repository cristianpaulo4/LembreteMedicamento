import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
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
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[],
      ),
    );
  }
}
