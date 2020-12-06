import 'package:lebrete_medicamento/model/medicamentoModel.dart';
import 'package:lebrete_medicamento/repository/MedicamentoRepositoryInterface.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'cadastro_controller.g.dart';

@Injectable()
class CadastroController = _CadastroControllerBase with _$CadastroController;

abstract class _CadastroControllerBase with Store {
  final IMedicamentoRepository _repository;
  _CadastroControllerBase(this._repository);

  @action
  Future cadastroMedicamento(MedicamentoModel model, DateTime dateTime) async {
    if (await this._repository.cadastrar(model, dateTime)) {
      print('Cadastrado com sucesso');
      Modular.to.pop();
    }
  }
}
