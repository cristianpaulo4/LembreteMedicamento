import 'package:sqlcool/sqlcool.dart';

class BancoLocal {
  Db _db = Db();

  Future<Db> inicializar() async {
    print('Criando Banco');
    String dbpath = "6.sqlite";
    DbTable dados = DbTable("dados")
      ..varchar("nome")
      ..varchar("descricao")
      ..integer("qtdTotal")
      ..integer("qtdDiaria")
      ..integer("intervalos")
      ..boolean("comprimido", defaultValue: true);

    DbTable dose = DbTable("dose")
      ..varchar("time")
      ..boolean("ok", defaultValue: false)
      ..foreignKey(
        "idMedicamento",
        reference: 'dados',
        onDelete: OnDelete.cascade,
      );

    List<DbTable> schema = [dados, dose];

    try {
      await _db.init(path: dbpath, schema: schema);
      print('Banco inicialidado');
      return _db;
    } catch (e) {
      rethrow;
    }
  }
}
