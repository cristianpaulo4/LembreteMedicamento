import 'package:lebrete_medicamento/app/banco/bancoSql.dart';
import 'package:lebrete_medicamento/app/modules/cadastro/cadastro_controller.dart';
import 'package:lebrete_medicamento/app/modules/cadastro/cadastro_page.dart';
import 'package:lebrete_medicamento/app/modules/detalhes/detalhes_page.dart';
import 'package:lebrete_medicamento/app/modules/telaLembrete/tela_lembrete_page.dart';
import 'package:lebrete_medicamento/repository/MedicamentoRepository.dart';
import 'package:lebrete_medicamento/repository/MedicamentoRepositoryInterface.dart';

import 'app_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:lebrete_medicamento/app/app_widget.dart';
import 'package:lebrete_medicamento/app/modules/home/home_module.dart';

import 'modules/detalhes/detalhes_controller.dart';
import 'modules/telaLembrete/tela_lembrete_controller.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        $AppController,
        $DetalhesController,
        Bind((i) => BancoLocal()),
        Bind<IMedicamentoRepository>((i) => MedicamentoRepository(i.get())),
        Bind((i) => CadastroController()),
        $TelaLembreteController,
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, module: HomeModule()),
        ModularRouter(
          '/cadastro',
          child: (_, args) => CadastroPage(),
          transition: TransitionType.downToUp,
        ),
        ModularRouter(
          '/detalhes',
          child: (_, args) => DetalhesPage(
            model: args.data,
          ),
          transition: TransitionType.fadeIn,
        ),
        ModularRouter(
          '/lembrete',
          child: (_, args) => TelaLembretePage(),
          transition: TransitionType.fadeIn,
        ),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
