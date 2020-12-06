import 'tela_lembrete_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'tela_lembrete_page.dart';

class TelaLembreteModule extends ChildModule {
  @override
  List<Bind> get binds => [
        $TelaLembreteController,
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute,
            child: (_, args) => TelaLembretePage()),
      ];

  static Inject get to => Inject<TelaLembreteModule>.of();
}
