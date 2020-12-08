import 'package:flutter_modular/flutter_modular.dart';
import 'package:lebrete_medicamento/app/banco/bancoSql.dart';
import 'package:lebrete_medicamento/app/notificacao/notificacao.dart';
import 'package:lebrete_medicamento/model/doesModel.dart';
import 'package:lebrete_medicamento/model/medicamentoModel.dart';
import 'package:lebrete_medicamento/repository/MedicamentoRepositoryInterface.dart';
import 'package:sqlcool/sqlcool.dart';

class MedicamentoRepository implements IMedicamentoRepository {
  final BancoLocal _bancoLocal;
  MedicamentoRepository(this._bancoLocal);

  @override
  Future<bool> cadastrar(MedicamentoModel model, DateTime dateTime) async {
    var _db = await _bancoLocal.inicializar();

    int id = await _db.insertManageConflict(
      table: "dados",
      row: model.toMap(),
      conflictAlgorithm: null,
    );

    int hrs = model.intervalos;
    int qtdDoses = (model.qtdTotal / model.qtdDiaria).floor();

    // inserir dosses
    for (var i = 0; i < qtdDoses; i++) {
      var timeDelayed = dateTime.add(Duration(hours: (hrs * i)));
      print(timeDelayed);
      int idDose = await _db.insertManageConflict(
        table: "dose",
        row: {
          'idMedicamento': '$id',
          'time': '$timeDelayed',
        },
        conflictAlgorithm: null,
      );

      // criar notificação
      await Notificacao().notificationAfterSec(idDose, timeDelayed, model);
    }
    return true;
  }

  // listar medicamentos
  @override
  Future<List<MedicamentoModel>> listar() async {
    var _db = await _bancoLocal.inicializar();
    List<Map<String, dynamic>> rows = await _db.select(
      table: "dados",
    );
    List<Map<String, dynamic>> doses = await _db.select(
      table: "dose",
    );
  }

  @override
  Future<List<DoseModel>> listarDoses(int id) async {
    var _db = await _bancoLocal.inicializar();
    List<DoseModel> listDoses = List();
    List<Map<String, dynamic>> rows =
        await _db.select(table: "dose", where: "idMedicamento=$id");

    rows.forEach((element) {
      listDoses.add(DoseModel.fromMap(element));
    });
    return listDoses;
  }

  @override
  Future<List<Map>> listarDosesParaTomar() async {
    var _db = await _bancoLocal.inicializar();

    List<Map<String, dynamic>> join = await _db.join(
      table: "dados",
      joinTable: "dose",
      joinOn: "dados.id=dose.idMedicamento",
      orderBy: "dados.id DESC",
      where: "dose.time<='${DateTime.now()}' and ok='false'",
    );

    return join;
  }

  @override
  Future<bool> tomarRemedio(int id) async {
    try {
      var _db = await _bancoLocal.inicializar();
      int updated = await _db.update(
        table: "dose",
        row: {'ok': '1'},
        where: "id=$id",
        verbose: true,
      );

      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<bool> excluirMedicamento(int id) async {
    try {
      var _db = await _bancoLocal.inicializar();
      await _db.delete(table: "dose", where: "idMedicamento=$id");
      await _db.delete(table: "dados", where: "id=$id");
      return true;
    } catch (e) {
      return false;
    }
  }
}
