import 'package:lebrete_medicamento/app/banco/bancoSql.dart';
import 'package:lebrete_medicamento/repository/MedicamentoRepositoryInterface.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
part 'tela_lembrete_controller.g.dart';

@Injectable()
class TelaLembreteController = _TelaLembreteControllerBase
    with _$TelaLembreteController;

abstract class _TelaLembreteControllerBase with Store {
  final IMedicamentoRepository _repository = Modular.get();

  @observable
  ObservableFuture<List<Map>> _listaDoses;

  _TelaLembreteControllerBase() {
    _init();
  }

  @action
  _init() {
    this._listaDoses = this._repository.listarDosesParaTomar().asObservable();
  }

  Future<bool> tomarRemedio(int id) async {
    if (await this._repository.tomarRemedio(id)) {
      _init();
    }
  }

  @computed
  ObservableFuture<List<Map>> get listarLembrete => this._listaDoses;
}
