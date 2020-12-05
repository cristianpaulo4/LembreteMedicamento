import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'detalhes_controller.g.dart';

@Injectable()
class DetalhesController = _DetalhesControllerBase with _$DetalhesController;

abstract class _DetalhesControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
