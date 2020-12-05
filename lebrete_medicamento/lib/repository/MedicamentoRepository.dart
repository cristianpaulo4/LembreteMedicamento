import 'package:lebrete_medicamento/app/banco/bancoSql.dart';
import 'package:lebrete_medicamento/model/medicamentoModel.dart';
import 'package:lebrete_medicamento/repository/MedicamentoRepositoryInterface.dart';
import 'package:sqlcool/sqlcool.dart';

class MedicamentoRepository implements IMedicamentoRepository {
  final BancoLocal bancoLocal;
  MedicamentoRepository(this.bancoLocal);

  @override
  Future<bool> cadastrar(MedicamentoModel model) async {
    Db db = await bancoLocal.inicializar();
    print(model.toMap());
    int id = await db.insertManageConflict(
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
      var timeDelayed = DateTime.now().add(Duration(hours: (hrs * i)));
      print(timeDelayed);
      await db.insertManageConflict(
        table: "dose",
        row: {
          'idMedicamento': '$id',
          'time': '$timeDelayed',
        },
        conflictAlgorithm: null,
      );
    }
    return true;
  }

  // listar medicamentos
  @override
  Future<List<MedicamentoModel>> listar() async {
    Db db = await bancoLocal.inicializar();
    List<Map<String, dynamic>> rows = await db.select(
      table: "dados",
    );
    List<Map<String, dynamic>> doses = await db.select(
      table: "dose",
    );
    print(doses);
  }
}
