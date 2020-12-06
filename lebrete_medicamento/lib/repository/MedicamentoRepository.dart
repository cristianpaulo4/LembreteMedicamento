import 'package:flutter_local_notifications/flutter_local_notifications.dart';
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
    print(model.toMap());
    Db _db = await this._bancoLocal.inicializar();

    int id = await _db.insertManageConflict(
      table: "dados",
      row: model.toMap(),
      conflictAlgorithm: null,
    );

    int hrs = model.intervalos;
    int qtdDoses = (model.qtdTotal / model.qtdDiaria).floor();

    print(qtdDoses);
    print('*' * 50);

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
    Db _db = await this._bancoLocal.inicializar();
    List<Map<String, dynamic>> rows = await _db.select(
      table: "dados",
    );
    List<Map<String, dynamic>> doses = await _db.select(
      table: "dose",
    );
  }

  @override
  Future<List<DoseModel>> listarDoses(int id) async {
    Db _db = await this._bancoLocal.inicializar();
    List<DoseModel> listDoses = List();
    List<Map<String, dynamic>> rows =
        await _db.select(table: "dose", where: "idMedicamento=$id");

    rows.forEach((element) {
      listDoses.add(DoseModel.fromMap(element));
    });
    return listDoses;
  }
}
