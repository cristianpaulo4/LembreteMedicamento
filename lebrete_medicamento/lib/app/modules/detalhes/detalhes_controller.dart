import 'package:lebrete_medicamento/model/doesModel.dart';
import 'package:lebrete_medicamento/repository/MedicamentoRepositoryInterface.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'detalhes_controller.g.dart';

@Injectable()
class DetalhesController = _DetalhesControllerBase with _$DetalhesController;

abstract class _DetalhesControllerBase with Store {
  final IMedicamentoRepository _repository;
  _DetalhesControllerBase(this._repository);

  @observable
  ObservableFuture<List<DoseModel>> _listaDoses;

  @action
  init(int id) {
    _listaDoses = this._repository.listarDoses(id).asObservable();
  }

  @action
  Future<bool> excluirMedicamento(int id) async {
    await this._repository.excluirMedicamento(id);
  }

  @computed
  ObservableFuture<List<DoseModel>> get listarDoses => this._listaDoses;
}
