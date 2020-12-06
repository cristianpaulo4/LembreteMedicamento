import 'package:lebrete_medicamento/app/banco/bancoSql.dart';
import 'package:lebrete_medicamento/repository/MedicamentoRepositoryInterface.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:sqlcool/sqlcool.dart';
part 'home_controller.g.dart';

@Injectable()
class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final IMedicamentoRepository _repository = Modular.get();
  final BancoLocal _bancoLocal = Modular.get();

  @observable
  ObservableStream<List<Map>> _medicamentos;
  @observable
  SelectBloc bloc;

  _HomeControllerBase() {
    _init();
  }

  _init() async {
    this._repository.listar();
    Db _db = await this._bancoLocal.inicializar();

    this.bloc = SelectBloc(
      table: "dados",
      orderBy: "id DESC",
      verbose: true,
      database: _db,
      reactive: true,
    );
    _medicamentos = this.bloc.items.asObservable();
  }

  @computed
  List<Map> get listarMedicamentos =>
      this._medicamentos == null ? null : this._medicamentos.data;
}
