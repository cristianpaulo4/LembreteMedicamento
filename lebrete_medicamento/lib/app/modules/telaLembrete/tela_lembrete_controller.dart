import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'tela_lembrete_controller.g.dart';

@Injectable()
class TelaLembreteController = _TelaLembreteControllerBase
    with _$TelaLembreteController;

abstract class _TelaLembreteControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
