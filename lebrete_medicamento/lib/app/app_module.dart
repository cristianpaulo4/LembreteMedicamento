import 'package:lebrete_medicamento/app/modules/detalhes/detalhes_controller.dart';
import 'package:lebrete_medicamento/app/modules/detalhes/detalhes_page.dart';

import 'app_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:lebrete_medicamento/app/app_widget.dart';
import 'package:lebrete_medicamento/app/modules/home/home_module.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        $AppController,
        $DetalhesController,
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, module: HomeModule()),
        ModularRouter(
          '/detalhes',
          child: (_, args) => DetalhesPage(
            comprimido: args.data['comp'],
            tag: args.data['tag'],
          ),
          transition: TransitionType.fadeIn,
        ),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
