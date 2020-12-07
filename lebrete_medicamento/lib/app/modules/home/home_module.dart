import 'package:lebrete_medicamento/app/banco/bancoSql.dart';
import 'package:lebrete_medicamento/app/modules/cadastro/cadastro_controller.dart';
import 'package:lebrete_medicamento/app/modules/cadastro/cadastro_page.dart';
import 'package:lebrete_medicamento/app/modules/detalhes/detalhes_controller.dart';
import 'package:lebrete_medicamento/app/modules/detalhes/detalhes_page.dart';
import 'package:lebrete_medicamento/app/modules/telaLembrete/tela_lembrete_controller.dart';
import 'package:lebrete_medicamento/app/modules/telaLembrete/tela_lembrete_page.dart';
import 'package:lebrete_medicamento/repository/MedicamentoRepository.dart';
import 'package:lebrete_medicamento/repository/MedicamentoRepositoryInterface.dart';

import 'home_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'home_page.dart';

class HomeModule extends ChildModule {
  @override
  List<Bind> get binds => [
        $HomeController,
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, child: (_, args) => HomePage()),
      ];

  static Inject get to => Inject<HomeModule>.of();
}
