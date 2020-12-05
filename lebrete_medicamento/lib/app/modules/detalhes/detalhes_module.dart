import 'detalhes_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'detalhes_page.dart';

class DetalhesModule extends ChildModule {
  @override
  List<Bind> get binds => [
        $DetalhesController,
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, child: (_, args) => DetalhesPage()),
      ];

  static Inject get to => Inject<DetalhesModule>.of();
}
