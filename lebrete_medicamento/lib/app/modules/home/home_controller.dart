import 'dart:async';
import 'package:lebrete_medicamento/app/banco/bancoSql.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:sqlcool/sqlcool.dart';
part 'home_controller.g.dart';

@Injectable()
class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final BancoLocal bancoLocal = Modular.get();
  @observable
  ObservableStream<List<Map>> _medicamentos;

  SelectBloc bloc;
  SelectBloc _lembreteBloc;

  @observable
  ObservableStream<List<Map>> _medicamentosEmDia;

  _HomeControllerBase() {
    init();
    verificarLembrete();
  }

  @action
  init() async {
    var _db = await bancoLocal.inicializar();
    this.bloc = SelectBloc(
      table: "dados",
      orderBy: "id DESC",
      database: _db,
      reactive: true,
      verbose: true,
    );
    _medicamentos = this.bloc.items.asObservable();
  }

  @action
  verificarLembrete() async {
    var _db = await bancoLocal.inicializar();
    this._lembreteBloc = SelectBloc(
      table: "dose",
      orderBy: "id DESC",
      database: _db,
      reactive: true,
      verbose: true,
      where: "dose.time<='${DateTime.now()}' and ok='false'",
    );

    // where: "dose.time<='${DateTime.now()}'and ok=0",

    this._lembreteBloc.items.listen((event) {
      print(event);
    });

    this._medicamentosEmDia = this._lembreteBloc.items.asObservable();
  }

  @computed
  List<Map> get listarMedicamentos =>
      this._medicamentos == null ? null : this._medicamentos.data;

  @computed
  List<Map> get getMedicamentoEmDia =>
      this._medicamentosEmDia == null ? null : this._medicamentosEmDia.data;
}
