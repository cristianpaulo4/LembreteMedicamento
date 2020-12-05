import 'package:sqlcool/sqlcool.dart';

class BancoLocal {
  Db db = Db();

  Future<Db> inicializar() async {
    String dbpath = "2.sqlite";
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
      await db.init(path: dbpath, schema: schema);
      return db;
    } catch (e) {
      rethrow;
    }
  }
}
